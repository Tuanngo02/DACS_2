<?php
include 'header.php';
$config_name = "member";
$config_title = "thành viên";
if (!empty($_SESSION['current_user'])) {
    if(!empty($_GET['action']) && $_GET['action'] == 'search' && !empty($_POST)){
        $_SESSION['product_filter'] = $_POST;
        header('Location: product_listing.php');exit;
    }
    if(!empty($_SESSION['product_filter'])){
        $where = "";
        foreach ($_SESSION['product_filter'] as $field => $value) {
            if(!empty($value)){
                switch ($field) {
                    case 'name':
                    $where .= (!empty($where))? " AND "."`".$field."` LIKE '%".$value."%'" : "`".$field."` LIKE '%".$value."%'";
                    break;
                    default:
                    $where .= (!empty($where))? " AND "."`".$field."` = ".$value."": "`".$field."` = ".$value."";
                    break;
                }
            }
        }
        extract($_SESSION['product_filter']);
    }
    $item_per_page = (!empty($_GET['per_page'])) ? $_GET['per_page'] : 10;
    $current_page = (!empty($_GET['page'])) ? $_GET['page'] : 1;
    $offset = ($current_page - 1) * $item_per_page;
    if(!empty($where)){
        $totalRecords = mysqli_query($con, "SELECT * FROM `Users` where (".$where.")");
    }else{
        $totalRecords = mysqli_query($con, "SELECT * FROM `Users`");
    }
    $totalRecords = $totalRecords->num_rows;
    $totalPages = ceil($totalRecords / $item_per_page);
    if(!empty($where)){
        $products = mysqli_query($con, "SELECT * FROM `Users` where (".$where.") ORDER BY `id` DESC LIMIT " . $item_per_page . " OFFSET " . $offset);
    }else{
        $products = mysqli_query($con, "SELECT * FROM `Users` ORDER BY `id` DESC LIMIT " . $item_per_page . " OFFSET " . $offset);
    }
    mysqli_close($con);
    ?>
<div class="main-content">
    <h1>Danh sách
        <?=$config_title?>
    </h1>
    <div class="listing-items">
        <div class="buttons">
            <a href="./<?=$config_name?>_editing.php">Thêm
                <?=$config_title?>
            </a>
        </div>
        <div class="listing-search">
            <form id="<?=$config_name?>-search-form" action="<?=$config_name?>_listing.php?action=search" method="POST">
                <fieldset>
                    <legend>Tìm kiếm
                        <?=$config_title?>:
                    </legend>
                    ID: <input type="text" name="id" value="<?=!empty($id)?$id:""?>" />
                    Tên
                    <?=$config_title?>: <input type="text" name="name" value="<?=!empty($name)?$name:""?>" />
                    <input type="submit" value="Tìm" />
                </fieldset>
            </form>
        </div>
        <div class="total-items">
            <span>Có tất cả <strong>
                    <?=$totalRecords?>
                </strong>
                <?=$config_title?> trên <strong>
                    <?=$totalPages?>
                </strong> trang
            </span>
        </div>
        <table id="customers">
            <tr>
                <th>Tên <?= $config_title ?></th>
                <th>Username</th>
                <th>Email</th>
                <th>Ngày tạo</th>
                <th>Ngày cập nhật</th>
                <th>Sửa</th>
                <th>Copy</th>
                <th>Xóa</th>
            </tr>
            <?php while ($row = mysqli_fetch_array($products)) {
                    ?>
            <tr>
                <td><?= $row['fullname'] ?></td>
                <td><?= $row['username'] ?></td>
                <td><?= $row['email'] ?></td>
                <td><?= date('d/m/Y H:i', $row['created_time']) ?></td>
                <td><?= date('d/m/Y H:i', $row['last_updated']) ?></td>
                <td><a href="./<?=$config_name?>_editing.php?id=<?= $row['id'] ?>">Sửa</a></td>
                <td><a href="./<?=$config_name?>_editing.php?id=<?= $row['id'] ?>&task=copy">Copy</a></td>
                <td><a href="./<?=$config_name?>_delete.php?id=<?= $row['id'] ?>">Xóa</a></td>
            </tr>
            <?php } ?>
            <!-- <li>
                <div class="listing-prop listing-name">
                    <?= $row['name'] ?>
                </div>
                <div class="listing-prop listing-button">
                    <a href="./<?=$config_name?>_delete.php?id=<?= $row['id'] ?>">Xóa</a>
                </div>
                <div class="listing-prop">
                    <a href="./<?=$config_name?>_delete.php?id=<?= $row['id'] ?>">Xóa</a>
                </div>
                <div class="listing-prop listing-button">
                    <a href="./<?=$config_name?>_editing.php?id=<?= $row['id'] ?>">Sửa</a>
                </div>
                <div class="listing-prop listing-button">
                    <a href="./<?=$config_name?>_editing.php?id=<?= $row['id'] ?>&task=copy">Copy</a>
                </div>
                <div class="listing-prop listing-time">
                    <?= date('d/m/Y H:i', $row['created_time']) ?>
                </div>
                <div class="listing-prop listing-time">
                    <?= date('d/m/Y H:i', $row['last_updated']) ?>
                </div>
                <div class="clear-both"></div>
            </li> -->

            
          
        </table>
        <!-- <ul id="<?= $config_name ?>-list">
            <li class="listing-item-heading">
                <div class="listing-prop listing-name" style="">Tên
                    <?= $config_title ?>
                </div>
                <div class="listing-prop" style="width:30px;">Link</div>
                <div class="listing-prop listing-button">
                    Sửa
                </div>
                <div class="listing-prop listing-button">
                    Copy
                </div>
                <div class="listing-prop listing-button">
                    Xóa
                </div>
                <div class="listing-prop listing-time">Ngày tạo</div>
                <div class="listing-prop listing-time">Ngày cập nhật</div>
                <div class="clear-both"></div>
            </li>
            <?php
                while ($row = mysqli_fetch_array($products)) {
                    ?>
            <li>
                <div class="listing-prop listing-name">
                    <?= $row['name'] ?>
                </div>
                <div class="listing-prop listing-button">
                    <a href="./<?=$config_name?>_delete.php?id=<?= $row['id'] ?>">Xóa</a>
                </div>
                <div class="listing-prop">
                    <a href="./<?=$config_name?>_delete.php?id=<?= $row['id'] ?>">Xóa</a>
                </div>
                <div class="listing-prop listing-button">
                    <a href="./<?=$config_name?>_editing.php?id=<?= $row['id'] ?>">Sửa</a>
                </div>
                <div class="listing-prop listing-button">
                    <a href="./<?=$config_name?>_editing.php?id=<?= $row['id'] ?>&task=copy">Copy</a>
                </div>
                <div class="listing-prop listing-time">
                    <?= date('d/m/Y H:i', $row['created_time']) ?>
                </div>
                <div class="listing-prop listing-time">
                    <?= date('d/m/Y H:i', $row['last_updated']) ?>
                </div>
                <div class="clear-both"></div>
            </li>
            <?php } ?>
        </ul> -->
        <?php
            include './pagination.php';
            ?>
        <div class="clear-both"></div>
    </div>
</div>
<?php
}
include './footer.php';
?>