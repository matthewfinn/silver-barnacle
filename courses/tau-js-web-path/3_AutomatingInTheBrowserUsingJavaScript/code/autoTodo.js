var autoTodo = new function() {

    this.clickItem = function(item) {
        item.click();
    }

    this.toggleAll = function() {
        document.querySelector('label.toggle-all-label').click();
    }

    this.selectItemX = function(x) {
        document.querySelector("ul.todo-list > li:nth-child(" + x + ") input.toggle").click()
    }

    this.deleteItemX = function(x) {
        document.querySelector('ul.todo-list > li:nth-child(' + x + ') button.destroy').click()
    }

    this.clearCompleted = function() {
        document.querySelector('button.clear-completed').click();
    }

    this.filterCompleted = function() {
        location.hash = "/completed";
    }

    this.filterAll = function() {
        location.hash = "/";
    }

    this.filterActive = function() {
        location.hash = "/active";
    }

    this.createTodo = function(name) {
        document.querySelector('input.new-todo').value = name;
        document.querySelector('input.new-todo').dispatchEvent(new Event('change',{
            'bubbles': true
        }));
    }

    this.amendTodo = function(x, amendedValue) {
        document.querySelector('ul.todo-list > li:nth-child(' + x + ') > div > label').dispatchEvent(new Event('dblclick',{
            'bubbles': true
        }));
        document.querySelector('ul.todo-list > li:nth-child(' + x + ') .edit').value = amendedValue;
        document.querySelector('ul.todo-list > li:nth-child(' + x + ') .edit').dispatchEvent(new Event('blur'));
    }

}