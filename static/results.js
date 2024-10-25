document.addEventListener("DOMContentLoaded", function() {
    const outputElement = document.getElementById("output");

    fetch('/progress')
        .then(response => response.body)
        .then(stream => {
            const reader = stream.getReader();
            return new ReadableStream({
                start(controller) {
                    function read() {
                        reader.read().then(({ done, value }) => {
                            if (done) {
                                controller.close();
                                return;
                            }
                            outputElement.textContent += new TextDecoder("utf-8").decode(value);
                            read();
                        });
                    }
                    read();
                }
            });
        });
});
