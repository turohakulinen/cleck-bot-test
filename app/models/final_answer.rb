class FinalAnswer < Answer
  def to_message
    {
      text: "You asked for this #{@name}. #{@message}",
      attachment: {
        type: 'image',
        payload: {
          url: @photo
        }
      }
    }
  end
end
