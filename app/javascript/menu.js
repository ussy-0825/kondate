if (document.URL.match( "/menus/new" )) {
  window.addEventListener("load", recipeSort);
  window.addEventListener("load", addMenu);
  window.addEventListener("load", closeModal);
  window.addEventListener("load", deleteMenu);
}

function recipeSort() {
  let sort = document.getElementById("sort");
  sort.addEventListener("click", () => {
        let selectGenre = document.getElementById("genre");
        let genreId = selectGenre.selectedIndex;
        genreId = selectGenre.options[genreId].value;
    
        let selectSideDishes = document.getElementById("side-dishes");
        let sideDishesId = selectSideDishes.selectedIndex;
        sideDishesId = selectSideDishes.options[sideDishesId].value;
    
        // let selectCookTime = document.getElementById("cook-time");
        // let cookTimeId = selectCookTime.selectedIndex;
        // cookTimeId = selectCookTime.options[cookTimeId].value;
    
        const XHR = new XMLHttpRequest();
        XHR.open("GET", `/menus/sort?genre=${genreId}&sidedishes=${sideDishesId}`, true);
        XHR.responseType = "json";
        XHR.send();
        XHR.onload = () => {
          if (XHR.status != 200) {
            alert(`Error ${XHR.status}: ${XHR.statusText}`);
            return null;
          }
          let recipes = XHR.response.recipe;
          let menuList = document.getElementById("menu-list");
          
          recipes.forEach( recipe => {
            let menuData = document.createElement('div');
            menuData.setAttribute('class', 'menu-data');
            let menuTitle = document.createElement('div');
            menuTitle.setAttribute('class', 'menu-title');
            menuTitle.innerHTML = recipe.cooking_name
            let imgElement = document.createElement('img');
            imgElement.src = recipe.image;
            imgElement.setAttribute('class', 'add-menu');
            imgElement.setAttribute('id', recipe.id);
            imgElement.width = 200;
            imgElement.height = 180;
            menuData.appendChild(menuTitle);
            menuData.appendChild(imgElement);
            menuList.insertAdjacentElement("afterbegin", menuData);
            $("#modal-overlay").fadeIn("slow");
          });
        }
  });
}

function addMenu() {
  const addMenuEvent = document.getElementById("menu-list");
  addMenuEvent.addEventListener("mouseenter", () => {
    let menu = document.querySelectorAll(".menu-data");
    menu.forEach(function(list) {
      list.addEventListener('click', addMenus);
      function addMenus(e) {
        const selectMenu = e.currentTarget;
        selectMenu.removeEventListener('click', addMenus);

        let menuClose = document.createElement('div');
        menuClose.setAttribute("class", "menu-data-close");
        menuClose.appendChild(selectMenu);

        let closeBtn = document.createElement('div');
        closeBtn.setAttribute("class", "close-btn");
        closeBtn.innerHTML = "×";
        menuClose.appendChild(closeBtn);

        let menuPalette = document.getElementById("menu-palette");
        menuPalette.appendChild(menuClose);

        let hideInput = document.getElementById("hide-input");
        let input = document.createElement('input');
        input.setAttribute("name", "menu[recipe_ids][]");
        input.setAttribute("class", "order");
        input.setAttribute("value", e.target.id);
        hideInput.appendChild(input);

        $("#modal-overlay").css('display','none');

        let changeClass = document.querySelectorAll(".menu-data");
        changeClass.forEach(function(list) {
          list.classList.remove('menu-data');
          list.classList.add('menu-palette-data');
        });

        let menuList = document.getElementById("menu-list");
          while(menuList.lastChild){
            menuList.removeChild(menuList.lastChild);
          };
      };
    });
  });
}

function deleteMenu() {
  const menuPalette = document.getElementById("menu-palette");
  menuPalette.addEventListener("mouseover", () => {
    let closeBtn = document.querySelectorAll(".close-btn");
    closeBtn.forEach(function(list) {
      list.addEventListener('click', (e) => {
        const clickMenu = e.target;
        const deleteMenu = clickMenu.parentNode;
        deleteMenu.remove();

        const deleteMenuFirstChild = deleteMenu.firstChild;
        const deleteMenuLastChild = deleteMenuFirstChild.lastChild;

        let input = document.querySelectorAll(".order");
        input.forEach(function(list) {
          if (list.value ==  deleteMenuLastChild.id) {
            list.remove();
          }
        });
      });
    });
  });
}

function closeModal() {
  const addMenuEvent = document.getElementById("menu-list");
  addMenuEvent.addEventListener("mouseenter", () => {
    $("#modal-close").unbind().click(function(){
      $("#modal-overlay").css('display','none');
        let menuList = document.getElementById("menu-list");
        let menuData = document.querySelectorAll(".menu-data");
        while(menuList.lastChild){
          menuList.removeChild(menuList.lastChild);
        }
    });
  });
}
