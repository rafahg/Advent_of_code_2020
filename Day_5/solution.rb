DATA = File.readlines('./Day_5/data.txt', chomp: true)



class PlaneSeats

  attr_reader :rows, :columns, :plane_rows, :plane_columns

    def initialize
      @rows = DATA[0].chars.slice(0,6)
      @columns = DATA[0].chars.slice(7,9)
      @plane_columns = (0..7).to_a
      @plane_rows = (0..127).to_a

    end


    def lower_half_rows
      start_row = @plane_rows.index(@plane_rows.first)
      end_row = @plane_rows.index(@plane_rows[@plane_rows.length / 2])
      @plane_rows = @plane_rows.slice(start_row,end_row)

    end

    def upper_half_rows
        start_row = @plane_rows.index(@plane_rows[@plane_rows.length / 2])
        end_row = @plane_rows.last
        @plane_rows = @plane_rows.slice(start_row,end_row)
    end

    def lower_half_columns
      start_column = @plane_columns.index(@plane_columns.first)
      end_column = @plane_columns.index(@plane_columns[@plane_columns.length / 2])
      @plane_columns = @plane_columns.slice(start_column,end_column)
    end

    def upper_half_columns
        start_column = @plane_columns.index(@plane_columns[@plane_columns.length / 2])
        end_column = @plane_columns.last
        @plane_columns = @plane_columns.slice(start_column,end_column)
    end

    def row_assigner
      @rows.each do |letter|
        letter == "F" ? self.lower_half_rows : self.upper_half_rows
      end 
      @plane_rows.first
    end

    def columns_assigner
      @columns.each do |letter|
        letter == "L" ? self.lower_half_columns : self.upper_half_columns
      end
      @plane_columns.first
    end

    


end

a = PlaneSeats.new












