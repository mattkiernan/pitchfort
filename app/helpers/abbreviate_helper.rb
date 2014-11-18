module AbbreviateHelper
  def abbreviate(attributes)
    check_if_no(attributes)
  end

  def check_if_no(attributes)
    if attributes == []
      "None"
    else
      display(attributes)
    end
  end

  def display(attributes)
    first_attribute = attributes.first.name
    remaining_attributes = attributes.count - 1
    if remaining_attributes > 0
      "#{first_attribute} & #{remaining_attributes} " +
        "other".pluralize(remaining_attributes)
    else
      "#{first_attribute}"
    end
  end
end
