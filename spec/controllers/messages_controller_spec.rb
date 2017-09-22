require 'rails_helper'

describe MessagesController do

  let(:user) { create(:user) }
  let(:group){ create(:group) }
  let(:message){ create(:message) }


  describe 'GET #index' do

    context 'user_signed_in' do
      before do
        login_user user
        get :index, group_id: group
      end
      it 'assigns the requested message to @message' do
        expect(assigns(:message)).to be_a_new(Message)
      end
      it 'renders the :index templete ' do
        expect(response).to render_template :index
      end
    end

    context 'user_signed_out' do
      it 'redirect sign_in' do
        get :index, group_id: group
        expect(response).to redirect_to user_session_path
      end
    end

  end

  describe 'POST #create' do

    context 'user_signed_in' do
      before do
       login_user user
      end

      context 'succes in saving' do
        it 'saved on database' do
          expect{ post :create, params: { group_id: group, message: attributes_for(:message) } }.to change{ Message.count }.by(1)
        end
        it 'redirect_to group_messages_path after saving' do
          post :create, params: { group_id: group, message: attributes_for(:message)}
          expect(response).to redirect_to group_messages_path
        end
      end

      context 'mistake to save' do
        it 'mistook to save on database' do
          expect{ post :create, params: { group_id: group, message: attributes_for(:message, content: nil, image: nil) } }.to change{ Message.count }.by(0)
        end
        it 'redirect_to group_messages_path with error message after mistook' do
          post :create, params: { group_id: group, message: attributes_for(:message, content: nil, image: nil) }
          expect(flash[:alert]).to include('メッセージを入力してください')
        end
      end
    end

    context 'user_signed_out' do
      it 'redirect to sign_in' do
        post :create, params: { group_id: group, message: attributes_for(:message, content: nil, image: nil) }
        expect(response).to redirect_to user_session_path
      end
    end
  end
end
