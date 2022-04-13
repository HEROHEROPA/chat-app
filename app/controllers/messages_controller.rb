class MessagesController < ApplicationController
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])#@messageには、Message.newで生成した、Messageモデルのインスタンス情報を代入します。
    @messages = @room.messages.includes(:user)#メッセージを表示させる為にユーザー情報を一緒に一挙に取得（N+1問題）する。
  end
    # @roomには、Room.find(params[:room_id])と記述することで、paramsに含まれているroom_idを代入します。
    # 紐解いて説明すると、直前の問題にあった通りルーティングをネストしているため/rooms/:room_id/messagesといったパスになります。
    # パスにroom_idが含まれているため、paramsというハッシュオブジェクトの中に、room_idという値が存在しています。そのため、params[:room_id]と記述することでroom_idを取得できます。
    
    def create
      @room = Room.find(params[:room_id])
      @message = @room.messages.new(message_params) #ネストしているルートなので左記の記述ができる。
      if @message.save
        redirect_to room_messages_path(@room)
      else
        @messages = @room.messages.includes(:user)#@messagesが定義されていないとエラーになってしまいます。そこで、indexアクションと同様に@messagesを定義する必要があります。
        render :index
      end
    end
    # @room.messages.newでチャットルームに紐づいたメッセージのインスタンスを生成し、message_paramsを引数にして、privateメソッドを呼び出します。
    
    
    private
  
    def message_params
      params.require(:message).permit(:content).merge(user_id: current_user.id)
    end  
    # privateメソッドとしてmessage_paramsを定義し、メッセージの内容contentをmessagesテーブルへ保存できるようにします。
    # パラメーターの中に、ログインしているユーザーのidと紐付いている、メッセージの内容contentを受け取れるように許可します。
    
    
  
end
