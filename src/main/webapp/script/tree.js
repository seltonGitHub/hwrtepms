var menu = {
    setting: {
        isSimpleData: true,
        treeNodeKey: "mid",
        treeNodeParentKey: "pid",
        showLine: true,
        root: {
            isRoot: true,
            nodes: []
        }
    },
    loadMenuTree: function () {

        $.ajax({
            url: '/role/showLeftMenus.json',
            type: 'POST', //GET
            async: true,    //或false,是否异步
            data: {},
            timeout: 5000,    //超时时间
            dataType: 'json',
            success: function (data, textStatus, jqXHR) {
                console.log(data);

                // var privilegeData=JSON.parse(data);


                $("#menuTree").zTree(menu.setting, data);
            },
            error: function (xhr, textStatus) {

            }

        });


    }
};

$().ready(function () {
    menu.loadMenuTree();
});
