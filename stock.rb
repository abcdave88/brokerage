
class Stock

  attr_accessor :name, :price, :code,  :volume

  def initialize(options={})
    @name = options[:name]
    @price = options[:price]
    @code = options[:code]
    @volume =options[:volume]
  end
end