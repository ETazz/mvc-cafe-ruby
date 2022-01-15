require_relative '../models/menu_item'
require_relative '../models/menu'

describe MenuItem do 
    it 'should create a menu item with name and price' do
        name = 'latte'
        price = 3.50
        item = MenuItem.new(name, price) 
        expect(item.name).to eq(name)
        expect(item.price).to eq(price)
    end
end

describe Menu do 
    it 'should add an item to the menu' do 
        menu = Menu.new
        name = "latte"
        price = 3.50
        menu.add_item(name, price)
        expect(menu.get_items.length).to be (1)
    end
    it 'item should have expected price' do 
        menu = Menu.new 
        name = 'latte'
        price = 3.50
        menu.add_item(name, price)
        expect(menu.get_price(name)).to eq(price)
    end
end
