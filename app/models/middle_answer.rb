class MiddleAnswer < Answer
  def to_message
    {
      text: "You are at level #{@name}.",
    }
  end
end
