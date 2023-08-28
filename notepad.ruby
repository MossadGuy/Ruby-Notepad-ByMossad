def get_notebook_name
    puts "Not defterinin adını girin:"
    notebook_name = gets.chomp
    return notebook_name.empty? ? "notes.txt" : "#{notebook_name}.txt"
  end
  
  def show_notes(notebook_name)
    notes = File.readlines(notebook_name)
    if notes.empty?
      puts "Henüz hiç not eklenmemiş."
    else
      puts "Notlarınız:"
      notes.each_with_index { |note, index| puts "#{index + 1}. #{note}" }
    end
  end
  
  def add_note(notebook_name)
    puts "Bir not ekleyin:"
    new_note = gets.chomp
    File.open(notebook_name, 'a') { |file| file.puts(new_note) }
    puts "Not eklendi."
  end
  
  def delete_notebook(notebook_name)
    puts "#{notebook_name} not defterini ve içeriğini silmek istediğinize emin misiniz? (E/H)"
    confirmation = gets.chomp.downcase
    if confirmation == 'e'
      File.delete(notebook_name)
      puts "#{notebook_name} not defteri silindi."
    else
      puts "Silme işlemi iptal edildi."
    end
  end
  
  notebook_name = get_notebook_name
  
  loop do
    puts "Ne yapmak istersiniz?"
    puts "1. Görüntüle\n2. Ekle\n3. Sil (Not)\n4. Sil (Defter)\n5. Çıkış"
    choice = gets.chomp.to_i
  
    case choice
    when 1
      show_notes(notebook_name)
    when 2
      add_note(notebook_name)
    when 3
      delete_note(notebook_name)
    when 4
      delete_notebook(notebook_name)
      break
    when 5
      puts "Not defteri kapatılıyor. İyi günler!"
      break
    else
      puts "Geçersiz bir seçenek girdiniz."
    end
  end
  loop