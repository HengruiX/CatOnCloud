class AttachmentsController < ApplicationController
	def new
      	@attachment = Attachment.new
   	end

   	def create
      	@attachment = Attachment.new(attachment_params)
      	@attachment.save
   	end

   	private
   	def attachment_params
   		puts params
      	params.require(:attachment).permit(:attachment)
   	end
end
