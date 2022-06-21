function post (){
  const submit = document.getElementById("submit");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    const form = document.getElementById("form");
    const formData = new FormData(form);
    const XHR = new XMLHttpRequest();
    XHR.open("POST", `/houses/${gon.house_id}/roles`, true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      const list = document.getElementById("list");
      const formText = document.getElementById("content");
      const formCategory = document.getElementById("content");
      const item = XHR.response.post;
      const category = XHR.response.category;
      const html = `
        <div class="new-role-list">
          <div class="new-role-category">
            ${category}
          </div>
          <div class="new-role-content">       
            <label>
              <input type="checkbox" name="level" value="bad">
              ${item.content}
            </label>
          </div>
        </div>`;
      list.insertAdjacentHTML("afterend", html);
      formText.value = "";
    };
  });
};

window.addEventListener('load', post);