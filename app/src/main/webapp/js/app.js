document.addEventListener("DOMContentLoaded", () => {
    const searchInput = document.querySelector("#employeeSearch");
    const table = document.querySelector("#employeeTable");
    if (searchInput && table) {
        searchInput.addEventListener("input", () => {
            const term = searchInput.value.toLowerCase();
            table.querySelectorAll("tbody tr").forEach(tr => {
                const text = tr.innerText.toLowerCase();
                tr.style.display = text.includes(term) ? "" : "none";
            });
        });
    }
});
