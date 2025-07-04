var rando = new function() {

    function getRandomInt(x) {
        return Math.floor(Math.random() * x);
    }

    function getRandomItemIndex() {
        max = document.querySelectorAll("ul.todo-list li").length;
        if (max === 0) {
            console.log("no items to choose from");
            return 0;
        }
        x = getRandomInt(max) + 1;
        return x;
    }

    this.toggleAll = function() {
        console.log("toggle all");
        autoTodo.toggleAll();
    }

    this.selectRandomItem = function() {
        x = getRandomItemIndex();
        if (x > 0) {
            console.log("select item " + x);
            autoTodo.selectItemX(x);
        }
    }

    this.deleteRandomItem = function() {
        x = getRandomItemIndex();
        if (x > 0) {
            console.log("delete item " + x);
            autoTodo.deleteItemX(x);
        }
    }

    this.clearCompleted = function() {
        console.log("clear completed");
        autoTodo.clearCompleted();
    }

    this.filterAll = function() {
        console.log("filter all");
        autoTodo.filterAll();
    }

    this.filterActive = function() {
        console.log("filter active");
        autoTodo.filterActive();
    }

    this.filterCompleted = function() {
        console.log("filter completed");
        autoTodo.filterCompleted();
    }

    this.createRandomTodo = function() {
        console.log("create todo");
        autoTodo.createTodo("random todo " + Date.now());
    }

    this.amendRandomTodo = function() {
        x = getRandomItemIndex();
        if (x > 0) {
            console.log("amend todo" + x);
            autoTodo.amendTodo(x, "amended random todo " + Date.now());
        }
    }
}
