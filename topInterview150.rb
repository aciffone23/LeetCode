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

def remove_element(nums, val)

    nums.each do |ele|
        if ele == val 
            nums.delete(ele)
        end
    end
    k = nums.length 
    
    return k
end

def remove_duplicates(nums)
  newArr = []

  nums.each do |ele|
      if !newArr.include?(ele)
          newArr << ele
      end
  end
  nums.clear.concat(newArr)
  k = newArr.length
  return k
  
end