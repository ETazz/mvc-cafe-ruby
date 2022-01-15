require_relative '../models/menu_item'
require_relative '../models/menu'
require_relative '../models/order'
require_relative '../models/cafe'

describe MenuItem do 
    it 'should create a menu item with name and price' do
        name = "latte"
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
        menu.add_item(name,price)
        expect(menu.get_items.length).to be (1)
    end

    it 'item should have expected price' do 
        menu = Menu.new 
        name = "latte"
        price = 3.50
        menu.add_item(name,price)
        expect(menu.get_price(name)).to eq(price)
    end
end

describe Order do 
    it 'should add an item to the order' do 
        order = Order.new
        name = "latte"
        quantity = 2 
        order.add(name,quantity)
        expect(order.items().length).to be (1)
    end
end

describe Cafe do 
    it 'should create a cafe with a name' do 
        name = 'My cafe'
        menu_items = {}
        cafe = Cafe.new(name, menu_items)
        expect(cafe.name).to eq(name)
    end

    it "should create a cafe with a menu" do
    name = "My cafe"
    menu_items = {"latte" => 3.50, "tea" => 2.00}
    cafe = Cafe.new(name, menu_items)
    expect(cafe.menu.get_items.length).to be(2)
    end

    it 'should add an item to order' do 
        name = "My cafe"
        menu_items = {"latte" => 3.50, "tea" => 2.00}
        cafe = Cafe.new(name, menu_items) 
        item = "latte"
        quantity = 1 
        cafe.add_to_order(item, quantity)
        expect(cafe.get_order().items().length).to be(1)
    end

    it 'should validate a valid menu item' do
        name = "My cafe"
        menu_items = {"latte" => 3.50, "tea" => 2.00}
        cafe = Cafe.new(name, menu_items) 
        expect(cafe.validate_item("latte")).to eq("latte")
    end

    it 'should return nil for a invalid menu item' do
        name = "My cafe"
        menu_items = {"latte" => 3.50, "tea" => 2.00}
        cafe = Cafe.new(name, menu_items) 
        expect(cafe.validate_item("scone")).to eq(nil)
    end

    it 'should return the order total' do
        name = "My cafe"
        menu_items = {"latte" => 3.50, "tea" => 2.00}
        cafe = Cafe.new(name, menu_items) 
        item = "latte"
        quantity = 1 
        cafe.add_to_order(item, quantity)
        expect(cafe.order_total).to be(3.50)

    end
end 