class UserEntriesController < ApplicationController
    
    def new
        @entry = UserEntry.new
    end

    def is_prime?(number)

        if number <= 1
            # only numbers > 1 can be prime.
            return false
        end
        
        id = 2
        while id < number
            if (number % id) == 0
                return false
            end
            
            id += 1
        end
        
        return true
    end

    def check
        #@number = params.fetch(:user_number)
        @entry = UserEntry.new(user_entry_params)
        @number = @entry.user_number

        if is_prime?(@number.to_i)
            @message = "#{@number} is a prime number."
        else
            @message = "#{@number} is not a prime number."
        end

        if @entry.save
            flash[:notice] = @message
            redirect_to result_path
        elsif @entry.errors.any?
            flash[:notice] = @entry.errors.full_messages[0]
            redirect_to user_entries_path
        end
    
    end

    private
        def user_entry_params
            params.require(:user_entry).permit(:user_number)
        end
end