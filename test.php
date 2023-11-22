<?php
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["submit"])) {
    $targetDirectory = "uploads/";

    // Đảm bảo thư mục upload tồn tại
    if (!file_exists($targetDirectory)) {
        mkdir($targetDirectory, 0755);
    }

    $uploadedFiles = $_FILES['images']['name'];
    $total = count($uploadedFiles);

    for ($i = 0; $i < $total; $i++) {
        $targetFile = $targetDirectory . basename($_FILES["images"]["name"][$i]);
        $uploadOk = 1;
        $imageFileType = strtolower(pathinfo($targetFile, PATHINFO_EXTENSION));

        // Kiểm tra nếu file đã tồn tại
        if (file_exists($targetFile)) {
            echo "Sorry, file already exists.";
            $uploadOk = 0;
        }

        // Kiểm tra kích thước file
        if ($_FILES["images"]["size"][$i] > 500000) {
            echo "Sorry, your file is too large.";
            $uploadOk = 0;
        }

        // Kiểm tra loại file
        if ($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
            && $imageFileType != "gif") {
            echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
            $uploadOk = 0;
        }

        // Kiểm tra nếu $uploadOk = 0
        if ($uploadOk == 0) {
            echo "Sorry, your file was not uploaded.";
        } else {
            // Nếu mọi thứ đều ok, thử tải lên file
            if (move_uploaded_file($_FILES["images"]["tmp_name"][$i], $targetFile)) {
                echo "The file " . htmlspecialchars(basename($_FILES["images"]["name"][$i])) . " has been uploaded.";
            } else {
                echo "Sorry, there was an error uploading your file.";
            }
        }
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Upload and Display Multiple Images</title>
    <style>
        #preview-container {
            display: flex;
            flex-wrap: wrap;
        }

        .image-preview {
            margin: 10px;
            max-width: 200px;
            max-height: 200px;
        }
    </style>
</head>
<body>

<form action="upload.php" method="post" enctype="multipart/form-data">
    <label for="images">Select Images:</label>
    <input type="file" name="images[]" id="images" multiple onchange="previewImages(event)">
    <input type="submit" value="Upload Images" name="submit">
</form>

<div id="preview-container"></div>

<script>
    function previewImages(event) {
        var previewContainer = document.getElementById('preview-container');
        previewContainer.innerHTML = ''; // Xóa hết các ảnh trước đó

        var files = event.target.files;

        for (var i = 0; i < files.length; i++) {
            var file = files[i];
            var reader = new FileReader();

            reader.onload = function (e) {
                var image = document.createElement('img');
                image.src = e.target.result;
                image.classList.add('image-preview');
                previewContainer.appendChild(image);
            };

            reader.readAsDataURL(file);
        }
    }
</script>

</body>
</html>
