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

def majority_element(nums)
  newHash = Hash.new(0)
  nums.each do |num| 
      newHash[num] += 1
  end

  grabele = newHash.select {|k,v| v >= nums.length/2.0}
  grabele.keys.first
end

def roman_to_int(s)
  romans = {
      "I" => 1,
      "V" => 5,
      "X" => 10,
      "L" => 50,
      "C" => 100, 
      "D" => 500, 
      "M" => 1000
  }

  number = 0

  s.each_char.with_index do |char,i|
      if char == 'I' && (s[i + 1] == 'V' || s[i + 1] == 'X')
          number -= 1
      elsif char == 'X' && (s[i + 1] == 'L' || s[i + 1] == 'C')
          number -= 10
      elsif char == 'C' && (s[i + 1] == 'D' || s[i + 1] == 'M')
          number -= 100
      else
          number += romans[char]
      end
  end
  return number
end
