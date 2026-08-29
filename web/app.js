window.addEventListener('message', function(event) {
    let item = event.data;
    if (item.action === "open") {
        document.getElementById("app").style.display = "flex";
    }
});

document.getElementById("close-btn").addEventListener("click", function() {
    document.getElementById("app").style.display = "none";
    fetch(`https://${GetParentResourceName()}/close`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json; charset=UTF-8' },
        body: json.encode({})
    });
});
