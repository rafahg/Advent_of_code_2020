DATA = File.readlines('./Day_5/data.txt', chomp: true)



class PlaneSeats

  attr_reader :rows, :columns, :plane_rows, :solution

def initialize
  @rows = rows
  @columns = columns
  @plane_rows = (0..127).to_a
  @solution = solution
end

def process_data
  @rows = DATA[0].chars.slice(0,7)
  @columns = DATA[0].chars.slice(8,10)
end

def lower_half
  start_row = @plane_rows[0]
  end_row = @plane_rows[@plane_rows.length / 2]
  @plane_rows = @plane_rows.slice(start_row,end_row)

end

def upper_half
    start_row = @plane_rows.index(@plane_rows[@plane_rows.length / 2])
    end_row = @plane_rows.last
    @plane_rows = @plane_rows.slice(start_row,end_row)
end


end

a = PlaneSeats.new







