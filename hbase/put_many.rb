import 'org.apache.hadoop.hbase.client.HTable'
import 'org.apache.hadoop.hbase.client.Put'

def jbytes(*args)
  args.map {|arg| arg.to_s.to_java_bytes }
end

def put_many table_name, row, column_values
  table = HTable.new @hbase.configuration, table_name
  data = Put.new *jbytes(row)

  column_values.each do |name, value|
    family, column = name.split(":")
    column ||= ""
    data.add *jbytes(family, column, value)
  end

  table.put data
end
