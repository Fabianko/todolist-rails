require 'json'
def sort_by_price_ascending(json_string)
    if json_string.length == 0
        return json_string
    end
    data = JSON.parse(json_string)
    data2 = data.sort_by { |p| [p['price'], p['name']] }
    return JSON.generate(data2)
end

a = '[{"name":"eggs","price":1},{"name":"arts","price":1},{"name":"coffee","price":9.99},{"name":"rice","price":4.04}]'
puts sort_by_price_ascending(a)
b = '[]'
puts sort_by_price_ascending(b)
