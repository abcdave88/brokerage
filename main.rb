require 'pry'

require_relative 'brokerage'
require_relative 'client'
require_relative 'portfolio'
require_relative 'stock'

b1 = Brokerage.new name: 'Investor Co'
c1 = Client.new name: 'Jeffery Goldsack', balance: 400000
p1 = Portfolio.new name: 'Tech portfolio'

appl = Stock.new name: 'Apple', price: 133, code: 'APPL', volume: 400000
fcap = Stock.new name: 'First Capital', price: 25, code: 'FCAP', volume: 200
mhgc = Stock.new name: 'Morgans Hotel Group', price: 15, code: 'MHGC', volume: 100000
bstc= Stock.new name: 'Biospecifics Technologies Corp', price: 38, code: 'BSTC', volume: 56300
dwas= Stock.new name: 'Dreamworks Animation Skg', price: 27, code: 'DWAS', volume: 300106
kpic = Stock.new name: 'Kite Pharma Inc', price: 52, code: 'KPIC', volume: 1100800


stocks_pool = [appl, fcap, mhgc, bstc, dwas, kpic]

p1.stocks << appl
c1.portfolios << p1
b1.clients << c1


def menu
  puts `clear`
  puts '*** GASE ***'
  puts '1 - Create a client'
  puts '2 - Create a portfolio'
  puts '3 - Purchase Stocks'
  puts '4 - Sell Stocks'
  puts '5 - List all clients and their balances'
  puts "6 - List a client's portfolios and associated values"
  puts "7 - List all stocks in a portfolio and associated values"
  puts 'q - Quit program'
  print "--> "
  response = gets.chomp
end

response = menu
  
  while response != 'q'
    case response
    when '1'
      system "clear"
      puts 'Create a client'
      puts '=======*======='
      puts 'Name:'
      cli_name = gets.chomp
      puts 'Client Balance:'
      cli_balance = gets.chomp.to_i 
      new_client = Client.new name: cli_name , balance: cli_balance
      b1.clients << new_client  
     

    when '2'
      system "clear"
      puts 'Create portfolio'
      puts '=======*========'
      puts 'Portfolio name:'
      port_name = gets.chomp
      new_portfolio = Portfolio.new name: port_name
      puts 'Asign portfolio to:'
      b1.clients.each_with_index do |client, index|
        puts"(#{index}) #{client.name}\n"
      end
      client_index = gets.chomp.to_i
        b1.clients[client_index].portfolios << new_portfolio


    when '3'
      system "clear"
      puts 'Purchase Stocks'
      puts '=======*======='
      stocks_pool.each do |stock|
        puts "Code: #{stock.code} ||Company: #{stock.name} ||Price: #{stock.price} ||Volume: #{stock.volume}"
      end
      puts 'What company do you want to buy in? use the stock code:'
      stock_code = gets.chomp
      puts 'How many shares do you want to purchase?'
      no_of_shares = gets.chomp.to_i
      # stocks_pool.index(stock_code)
      binding.pry
     
      


    when '4' 
      puts 'Sell Stocks'
    when '5'
      b1.clients.each do |client|
        puts "#{client.name}  £#{client.balance}"
      end

    when '6' 
      puts "List a client's portfolios and associated values"
    when '7'
      puts "7 - List all stocks in a portfolio and associated values"
    end # end of case

    puts "-" * 80
    puts 'enter to continue'
    gets
    response = menu
  end  # end of while 