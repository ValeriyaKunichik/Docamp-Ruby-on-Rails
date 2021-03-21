
document.addEventListener('turbolinks:load', function () {

    const openProjectButton = document.getElementById('new-project-button')
    const projectPopover = document.getElementById('new-project-popover')
    const projectName = document.getElementById('project-name-input') 
    const isFirstPage = document.getElementById('Firstpage') 
    if (openProjectButton && projectPopover) {
      
      openProjectButton.addEventListener('click', function () {
        
        return projectPopover.classList.contains('is-hidden') ? projectPopover.classList.remove('is-hidden') : null
      }, false)
      
      const cancelProjectPopover = document.getElementById('cancel-project-popover')
      cancelProjectPopover.addEventListener('click', function () {
        
        return projectPopover.classList.add('is-hidden')
      }, false)
    }
    
    if (isFirstPage) {

      const navnav= document.getElementById('mainnav')
     
      return navnav.classList.add('is-hidden')
      
    }

    
    
  })




 