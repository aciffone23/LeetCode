def h_index(citations)
    order = citations.sort.reverse
    h_index = 0 
    order.each_with_index do |ele, i|
      if ele >= i + 1 
        h_index = i + 1
      end
    end
    return h_index
end