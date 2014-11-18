module AbbreviateHelper
  def abbreviate(list, attribute)
    if list.empty?
      "None"
    else
      abbreviated_with_count(list, attribute)
    end
  end

  def abbreviated_with_count(list, attribute)
    first_value = list.first.send attribute
    remaining_count = list.count - 1
    if remaining_count > 0
      "#{first_value} & #{remaining_count}
      #{"other".pluralize(remaining_count)}"
    else
      first_value
    end
  end
end
