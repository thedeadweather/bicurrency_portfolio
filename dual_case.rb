require 'uri'
require 'net/http'
require 'rexml/document'

# метод возвращает равную долю в долларах
def exchange(rub, usd, rate)
(usd - rub / rate) / 2
end

begin
  uri = URI.parse('http://www.cbr.ru/scripts/XML_daily.asp')
  response = Net::HTTP.get_response(uri)
rescue SocketError => e
  puts "Возникла ошибка соединения:"
  puts e.message
  puts "Введите курс самостоятельно"
  usd_rate = STDIN.gets.to_f.truncate(2)
else
  doc = REXML::Document.new(response.body)
  # выцепляем с сайта курс,
  # переводим его в число float с двумя знаками после точки
  usd_rate =
    doc.root.elements['Valute[@ID="R01235"]'].elements['Value'].text.
    gsub(/,/, '.').to_f.truncate(2)
end

puts "Сегоняшний курс доллара: #{usd_rate}"
puts
puts "Сколько у вас рублей?"
rub = gets.to_f.truncate(2)
puts "Сколько у вас долларов?"
usd = gets.to_f.truncate(2)

sell_usd = exchange(rub, usd, usd_rate)
# если наша доля менее 1 цента
if sell_usd.abs < 0.01
  puts "портфель сбалансирован"
# если долларов больше, пишем округленную долю
elsif sell_usd > 0
  puts "вам надо продать #{sell_usd.round(2)} $"
# если рублей больше, переводим долю в рубли и округляем
else
  puts "вам надо продать #{(sell_usd * usd_rate).abs.round(2)} руб"
end
