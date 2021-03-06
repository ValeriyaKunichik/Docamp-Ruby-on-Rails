document.addEventListener('turbolinks:load', function () {
  const messageForm = document.getElementById("new-message-form")
  const messageInput = document.getElementById("message-input")
  const messageContainer = document.getElementById("chat-contents")
  

  if (window.projectId && messageForm) {
    App.project_chat = App.cable.subscriptions.create(
      {
        channel: 'ProjectChatChannel',
        room: window.projectId
      },
      {
        connected: function () {
          // Called when the subscription is ready for use on the server
        },

        disconnected: function () {
          // Called when the subscription has been terminated by the server
        },

        received: function (data) {
          var messageNode = document.createElement('div')
          messageNode.innerHTML = data.message
          messageContainer.appendChild(messageNode)
        },

        sendMessage: function (content) {
          this.perform('send_message', { content, project_id: window.projectId })
        }
      }
    )

    messageForm.addEventListener('submit', function (e) {
      e.preventDefault()
      App.project_chat.sendMessage(messageInput.value)
      messageInput.value = ''
    })
  }
})