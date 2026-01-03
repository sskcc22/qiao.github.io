// 简单的表单处理脚本
var form = document.getElementById('contact-form');
if (form) {
    form.onsubmit = function(event) {
        event.preventDefault();
        alert('表单已提交！');
        return false;
    };
}
