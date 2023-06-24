module Api
  module Notes
    def self.new_note(params)
      note = Note.new(title: params[:title], description: params[:description], user_id: params[:user_id], child_category_id: params[:child_category_id])

      begin
        note.save! #user is valid
      rescue
        return ServiceContract.error("Error") unless note.valid?
      end

      ServiceContract.success(note)
    end
  end
end
