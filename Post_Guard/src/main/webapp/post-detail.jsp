<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta charset="utf-8">
        
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title></title>
        
       
        
    </head>
    <body>
      
        <div class="container">
            <hr/>
            <div class="row">
                <div class="col-md-10">
                    <table class="table table-condensed">
                        <thead>
                            <tr align="center">
                                <th width="10%">����</th>
                                <th width="60%">�Խ��� ���� �Դϴ�.</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>�ۼ���
                                </td>
                                <td>
                                2014-12-15 04:45:23
                                </td>
                            </tr>
                            <tr>
                                <td>�۾���
                                </td>
                                <td>
                                husk <span style='float:right'>��ȸ : 0</span>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <p>�̸�, �н����� ������ �����ð� Ȯ�ι�ư�� ��������.</p>
                       
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <table id="commentTable" class="table table-condensed"></table>
                    <table class="table table-condensed">
                        <tr>
                            <td>
                                <span class="form-inline" role="form">
                                    <p>
                                        <div class="form-group">
                                            <input type="text" id="commentParentName" name="commentParentName" class="form-control col-lg-2" data-rule-required="true" placeholder="�̸�" maxlength="10">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" id="commentParentPassword" name="commentParentPassword" class="form-control col-lg-2" data-rule-required="true" placeholder="�н�����" maxlength="10">
                                        </div>
                                        <div class="form-group">
                                            <button type="button" id="commentParentSubmit" name="commentParentSubmit" class="btn btn-default">Ȯ��</button>
                                        </div>
                                    </p>
                                        <textarea id="commentParentText" class="form-control col-lg-12" style="width:100%" rows="4"></textarea>
                                </span>
                            </td>
                        </tr>
                    </table>
                    <table class="table table-condensed">
                        <thead>
                            <tr>
                                <td>
                                    <span style='float:right'>
                                        <a href="as.jsp"><button type="button" id="list" class="btn btn-default">���</button></a>
                                        <button type="button" id="modify" class="btn btn-default">����</button>
                                        <button type="button" id="delete" class="btn btn-default">����</button>
                                        <a href="enrollas.jsp"><button type="button" id="write" class="btn btn-default">�۾���</button></a>
                                    </span>
                                </td>
                            </tr>
                        </thead>
                    </table>
</div>
            </div>
            <hr/>
        </div>    
    </body>
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
    
</html>