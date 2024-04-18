document.addEventListener('turbolinks:load',function () {
  document.addEventListener('DOMContentLoaded', function() {
    const btn = document.getElementById('dropdown_btn');
    if(btn) {
      btn.addEventListener('click', function(){
        this.classList.toggle('is-open');
      });
    }
  });
}());




/*var drop_down_button = document.querySelector('header_name')
var drop_down_list = document.querySelector('header_list')



drop_down_button.addEventsListener('click',function(){
  drop_down_list.classList.add('open')
})




/*const drop_button = document.getElementById('user_name_button')
const drop_up_button = document.getElementById('squre_button')

drop_button.addEventListener("click",function(){
  mypage-dropdown.classList.add('open-dropdown')
});

drop_up_button.addEventListener("click",function(){
  mypage-dropdown.classList.remove('open-dropdown')
});











document.addEventListener('turbolinks:load', function() {
    const mypageBtnContainer = document.getElementById('mypageBtnContainer');
      const mypageDropdown = document.getElementById('mypageDropdown');
    
      if (mypageBtnContainer) {
        mypageBtnContainer.addEventListener('click', function() {
          mypageDropdown.style.display = 'block';
        });
    
        mypageBtnContainer.addEventListener('click', function() {
          mypageDropdown.style.display = 'none';
        });
      }})*/
