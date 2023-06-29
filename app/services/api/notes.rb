module Api # same name as folder in services
  module Notes # same name as file in folder above
    def self.new_note(params)
      note = Note.new(title: params[:title], description: params[:description], user_id: params[:user_id], child_category_id: params[:child_category_id])

      begin
        note.save! #user is valid
      rescue
        return ServiceContract.error("Error") unless note.valid?
      end

      ServiceContract.success(note)
    end

    def self.delete_note(params)
      note = Note.find_by(id: params[:id])

      return ServiceContract.error("Note not found") unless note

      if note.destroy
        ServiceContract.success(note)
      else
        ServiceContract.error("Failed to delete note")
      end
    end

    def self.update_note(params)
      note = Note.find_by(id: params[:id])

      return ServiceContract.error("Note not found") unless note

      if note.update(title: params[:title], description: params[:description])
        ServiceContract.success(note)
      else
        ServiceContract.error("Failed to update note")
      end
    end
  end
end
