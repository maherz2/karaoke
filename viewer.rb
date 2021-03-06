class Viewer

  def main_menu_choice()
    while true
      system("clear")
      puts "The Karaoke Bar"
      puts ""
      puts "1-Display current rooms"
      puts "2-Check in a group"
      puts "3-Check entire room out"
      puts "4-Register new guest"
      puts "5-Charge guest"
      puts "6-Add music"
      puts "7-Edit Karaoke bar"
      puts "8-Exit"
      puts ""
      puts "9-Load test data"
      puts ""
      print "> "
      choice = gets.chomp.to_i

      kill_program() if choice == 8
      return choice if (choice > 0 && choice < 10)
    end
  end

  def edit_menu_options()
      while true
      system("clear")
      puts "Edit venue options"
      puts ""
      puts "1-Add food item to bar"
      puts "2-Add drink item to bar"
      puts "3-Add a new room"
      puts "4-Finished"
      puts ""
      print "> "
      choice = gets.chomp.to_i
      return if choice == 4
      return choice if (choice > 0 && choice < 4)
    end
  end

  def add_music_menu()
      while true
      system("clear")
      puts "Music menu"
      puts ""
      puts "1-Add a song to room"
      puts "2-Add a playlist to room"
      puts "3-Save a rooms music as a playlist"
      puts "4-Finished"
      puts ""
      print "> "
      choice = gets.chomp.to_i
      return if choice == 4
      return choice if (choice > 0 && choice < 4)
    end
  end

  def get_song_details()
    system("clear")
    puts "What is the song title?"
    title = get_input()
    puts "Who is the artist?"
    artist = get_input()
    puts "What year was the song released?"
    year = get_input()
    song = create_song_hash(title, artist, year)
    return song
  end

  def get_input()
    print "> "
    return gets.chomp.downcase
  end

  def create_song_hash(title, artist, year)
    song = {}
    song[:title] = title
    song[:artist] = artist
    song[:year] = year
    return song
  end

  def kill_program()
    system("clear")
    abort("Good Bye!")
  end

  def in_or_out()
    system("clear")
    puts "Would you like to check a guest in or out?[in/out]"
    print "> "
    choice = gets.chomp.downcase
    return choice if choice == "in" || choice == "out"
  end

  def display_create_room()
    system("clear")
    puts "<<Room Creator>>"
    puts ""
    puts "What is the maximum capacity of this room?"
    max_cap = get_input()
    puts "How much does this room cost per guest?"
    print "> £"
    price = gets.to_i
    room = {songs: [], guests: [], max_capacity: max_cap, fee: price}
    return room
  end

  def return_guest_name()
    puts "Who is purchasing?"
    name = get_input()
    return name
  end

  def return_item_name(name)
    puts "What is #{name} purchasing?"
    item_name = get_input()
    return item_name
  end

  def successful_load()
    puts ""
    puts "-Succesfuly loaded!"
    puts ""
    sleep(2)
  end

  def unsuccessful_load()
    puts ""
    puts "Unsuccessful load, check default load files have data."
    puts ""
    sleep(2)
  end

  def confirmation_of_purchase(guest_name, item_name, item_price)
    puts ""
    puts "#{guest_name} paid £#{item_price.to_f} for #{item_name}"
    puts ""
    sleep(3)
  end

  def guest_cant_afford_item(guest_name, item_name, guest_money, item_price)
    puts ""
    puts "#{guest_name} has £#{guest_money} and can't afford #{item_name} for #{item_price}"
    puts ""
    sleep(4)
  end

  def invalid_item_message(item_or_guest)
    puts ""
    puts "<<#{item_or_guest} does not exist!>>"
    puts ""
    sleep(3)
  end

  def return_new_guest_info()
    system("clear")
    puts ""
    puts "<<Guest Creator>>"
    puts ""
    puts "What is the new guests name?"
    name = get_input()
    name.capitalize!
    puts "What is #{name}'s telephone numner?"
    tel = get_input.to_i
    puts "What is #{name}'s email?"
    email = get_input()
    puts "How much does #{name} have to spend?"
    money = get_input()
    puts "What is #{name}'s favourite song?"
    fav_song = get_input()

    guest = {name: name, tel: tel, email: email, money: money, fav_song: fav_song}
    return guest
  end

  def select_room_num(num_of_rooms, guest_name)
    puts ""
    puts "There are currently #{num_of_rooms} active rooms, which room will #{guest_name} be checked into?"
    while true

    room_number = get_input.to_i

      if (room_number < 1 || room_number > num_of_rooms)
        puts "That room doesn't exist! Try a room between 1 and #{num_of_rooms}"
      else
        return room_number - 1
      end
    end
  end

  def added_to_room_message(guest_name, room_index)
    room = room_index + 1
    puts ""
    puts "#{guest_name} was successfuly added to room #{room}!"
    puts ""
    sleep(3)
  end

  def list_rooms(num_of_rooms)
    count = 1
    puts ""
    puts "Current active rooms:"
    puts ""
    while count < num_of_rooms + 1
      puts "Room #{count}"
      count += 1
    end
  end

  def get_number_of_room_to(out_or_in)
    puts ""
    puts "Which room would you like to #{out_or_in}?"
    puts ""
    choice = get_input()
    return choice.to_i
  end

  def no_rooms_active()
    puts ""
    puts "There are currently no active rooms."
    puts ""
    sleep(3)
  end

  def successfuly_checked_out_guests(room_number)
    puts ""
    puts "Room #{room_number} has been successfuly checked out."
    puts ""
    sleep(2)
  end

  def room_stat_title()
    puts ""
    puts "Room \t Capacity \t Spend \t\t Songs"
  end

  def print_status_of_room(room_num, num_of_guests, max_cap, spend_of_guests, num_of_songs)
    puts "#{room_num} \t #{num_of_guests}/#{max_cap} \t\t £#{spend_of_guests} \t\t #{num_of_songs}"
  end

  def get_guest_list()
    puts ""
    puts "Enter filepath of guestlist:"
    file_path = get_input
    return file_path
  end

  def file_doesnt_exist()
    puts ""
    puts "File does not exist."
    sleep(2)
  end

  def get_new_foods()
    system("clear")
    puts "<<Food creator>>"
    puts "What is your new food called?"
    name = get_input()
    name.capitalize!
    puts "How would you describe that on a menu?"
    disc = get_input()
    puts "How much will you charge for #{name}?"
    print "> "
    price = gets.to_i
    return {name: name, discription: disc, price: price}
  end

  def get_new_drinks()
    system("clear")
    puts "<<Drink creator>>"
    puts "What is your new drink called?"
    name = get_input()
    name.capitalize!
    puts "What volume will that be served at?"
    disc = get_input()
    puts "How much will you charge for #{name}?"
    print "> "
    price = gets.to_i
    return {name: name, discription: disc, price: price}
  end

  def get_song_details()
    system("clear")
    puts "<<Song creator>>"
    puts "What is the songs title?"
    title = get_input()
    puts "Who is the artist?"
    artist = get_input()
    puts "What genre is #{title}?"
    genre = get_input()
    puts "What year was #{title} released?"
    year = get_input()
    song = {titel: title, artist: artist, genre: genre, year: year}
    return song
  end

  def get_filepath_of_playlist()
    puts ""
    puts "What is the file of your playlist called?"
    file_path = get_input
    return file_path
  end

end

