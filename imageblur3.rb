class Image

  def initialize(array)
    @array = array
  end

  def find_ones(array)
    output = []
    array.each_with_index do |row,y|
      row.each_with_index do |num,x|
        if num == 1
          output << [x,y]
        end
      end
    end 
    return output
  end 
  
  def blur_ones
    ones = find_ones(@array)

    ones.each do |x,y|
      if y > 0
        @array[y-1][x] = 1
      end
      if y < @array.length-1
        @array[y+1][x] = 1
      end
      if x > 0
        @array[y][x-1] = 1
      end
      if x < @array[x].length-1
        @array[y][x+1] = 1
      end
    end
  end

  def blur(num)
    num.times{ blur_ones }
  end
  
  def output_image
    @array.each { |x| puts x.join("") }
  end

end 

image = Image.new([
  [1, 0, 0, 0, 0, 1],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [1, 0, 0, 0, 0, 1]
])
image.blur(3)
image.output_image 