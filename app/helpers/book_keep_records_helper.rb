module BookKeepRecordsHelper
	def format_value(x=value)
		v = helper.number_with_precision(x, :precision => 2,:separator => '.',:delimiter => ' ')
		if x>0
			"+"+v+" zł"
		else
			v+" zł"
		end
	end

	def helper
		@helper ||= Class.new do
			include ActionView::Helpers::NumberHelper
		end.new
	end
end
