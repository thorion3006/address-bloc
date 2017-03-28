require_relative '../models/address_book'

class MenuController
    attr_reader :address_book
    
    def initialize
        @address_book = AddressBook.new
    end
    
    def main_menu
        puts "Main Menu - #{address_book.entries.count} entries"
        puts "1 - View all entries"
        puts "2 - View Entry Number n"
        puts "3 - Create an entry"
        puts "4 - Search for an entry"
        puts "5 - Import entries from a CSV"
        puts "6 - Exit"
        print "Enter your selection: "
        
        selection = gets.to_i
        
        case selection
            when 1
                system "clear"
                view_all_entries
                main_menu
            when 2
                system "clear"
                view_entry_n
                main_menu
            when 3
                system "clear"
                create_entry
                main_menu
            when 4
                system "clear"
                search_entries
                main_menu
            when 5
                system "clear"
                read_csv
                main_menu
            when 6
                puts "Good-bye!"        
                exit(0)
            else
                system "clear"
                puts "Sorry, that is not a vaild input"
                main_menu
        end
    end
        
    def view_all_entries
        address_book.entries.each do |entry|
            system "clear"
            puts entry.to_s
            
            entry_submenu(entry)
        end
        
        system "clear"
        puts "End of entries"
    end
    
    def view_entry_n
        print "Enter the entry number to view: "
        selection = gets.to_i
        system "clear"
        if selection == 0
            system "clear"
            main_menu
        elsif address_book.entries[selection-1]
            puts address_book.entries[selection-1].to_s
            
            entry_submenu(address_book.entries[selection-1])
        else
            puts "Entry number #{selection} is invalid. Try again or enter 0 to go back to main menu"
            view_entry_n
        end
    end
        
    def create_entry
        system "clear"
        puts "New AddressBloc Entry"
        print "Name: "
        name = gets.chomp
        print "Phone number: "
        phone = gets.chomp
        print "Email: "
        email = gets.chomp
        
        address_book.add_entry(name, phone, email)
        
        system "clear"
        puts "New entry created"
    end
        
    def search_entries
            
    end
        
    def read_csv
            
    end
    
    def entry_submenu(entry)
        puts "n - next entry"
        puts "d - delete entry"
        puts "e - edit this entry"
        puts "m - return to main menu"
        selection = gets.chomp
        
        case selection
            when "n"
                
            when "d"
                
            when "e"
                
            when "m"
                system "clear"
                main_menu
            else
                system "clear"
                puts "#{selection} is not a vaild input"
                entry_submenu(entry)
        end
    end
end