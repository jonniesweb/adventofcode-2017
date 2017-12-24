class Day8
  def initialize(ops)
    @ops = ops.each_line.map do |line|
      array = line.split(/\s+/)
      Statement.new({
          var: array[0],
          op: array[1],
          val: array[2].to_i,
          cvar: array[4],
          cop: array[5],
          cval: array[6].to_i
        })
    end

    @highest_value = -10000000

    @context = @ops.inject({}) do |context, statement|
      result = statement.execute(context)
      @highest_value = result if @highest_value < result
      context
    end
  end

  def largest_value
    @context.values.max
  end

  def highest_value
    @highest_value
  end
end

class Statement
  attr_reader :var, :op, :val, :cvar, :cop, :cval
  def initialize(attr)
    @var = attr[:var]
    @op = attr[:op]
    @val = attr[:val]
    @cvar = attr[:cvar]
    @cop = attr[:cop]
    @cval = attr[:cval]
  end

  def execute(context)
    value = context.fetch(@cvar, 0)
    condition = eval("value #{@cop} @cval", binding)

    if condition
      case op
      when 'inc'
        context[var] = context.fetch(var, 0) + val
      when 'dec'
        context[var] = context.fetch(var, 0) - val
      end
    else
      0
    end
  end
end
