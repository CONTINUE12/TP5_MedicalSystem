<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

function email($mailto, $nickname, $subject, $content)
{
    $mail = new PHPMailer(true);
    try {
        $mail->SMTPDebug = 0;                                 // Enable verbose debug output
        $mail->isSMTP();                                      // Set mailer to use SMTP
        $mail->Host = 'smtp.163.com';  // Specify main and backup SMTP servers
        $mail->SMTPAuth = true;                               // Enable SMTP authentication
        $mail->Username = 'leruge@163.com';                 // SMTP username
        $mail->Password = 'Ai157511';                           // SMTP password
        $mail->SMTPSecure = 'ssl';                            // Enable TLS encryption, `ssl` also accepted
        $mail->Port = 465;                                    // TCP port to connect to
        $mail->CharSet = 'utf-8';

        //Recipients
        $mail->setFrom('leruge@163.com', '梦中程序员');
        $mail->addAddress($mailto, $nickname);
        //Content
        $mail->isHTML(true);                                  // Set email format to HTML
        $mail->Subject = $subject;
        $mail->Body    = $content;

        return $mail->send();
    }catch (Exception $e) {
        exception($mail->ErrorInfo(), 1001);
    }
}

function replace($data)
{
    return str_replace('span', 'a', $data);
}

function arrayC($data)
{
	return implode('|', $data);
}
