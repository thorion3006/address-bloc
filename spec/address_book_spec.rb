require_relative '../models/address_book'

RSpec.describe AddressBook do
    
    describe "attributes" do
        it "responds to entries" do
            book = AddressBook.new
            expect(book).to respond_to(:entries)
        end
        
        it "initializes entries as an array" do
            book = AddressBook.new
            expect(book.entries).to be_an(Array)
        end
        
        it "initializes entries as empty" do
            book = AddressBook.new
            expect(book.entries.size).to eq(0)
        end
    end
    
    describe "#add_entry" do
        it "adds only one entry to the address book" do
            book = AddressBook.new
            book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            
            expect(book.entries.size).to eq(1)
        end
        
        it "adds the correct information to entries" do
            book = AddressBook.new
            book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            new_entry = book.entries[0]
            
            expect(new_entry.name).to eq('Ada Lovelace')
            expect(new_entry.phone_number).to eq('010.012.1815')
            expect(new_entry.email).to eq('augusta.king@lovelace.com')
        end
    end
    
    describe "#remove_entry" do
        it "removes a single entry from the address book" do
            book = AddressBook.new
            book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            book.add_entry('Sam Fisher', '020.024.2815', 'sam.fisher@lovelace.com')
            expect(book.entries.size).to eq(2)
            
            book.remove_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            expect(book.entries.size).to eq(1)
        end
        
        it "removes the correct information from the entries" do
            book = AddressBook.new
            book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            book.add_entry('Sam Fisher', '020.024.2815', 'sam.fisher@lovelace.com')
            
            book.remove_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            entry_left = book.entries[0]
            
            expect(entry_left.name).to eq('Sam Fisher')
            expect(entry_left.phone_number).to eq('020.024.2815')
            expect(entry_left.email).to eq('sam.fisher@lovelace.com')
        end
    end
end
