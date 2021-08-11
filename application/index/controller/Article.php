<?php

namespace app\index\controller;

use think\Db;

class Article extends Base
{
    public function article()
    {
        $articleInfo = model('Article')->find(input('id'));
        $articleInfo->setInc('click');
        $viewData = [
            'articleInfo' => $articleInfo
        ];
        $this->assign($viewData);
        return view();
    }

    public function m_articleAdd()
    {
        $id = session('index.id');
        $author = Db::name('member')->where('id', $id)->value('username');
        if (request()->isAjax()) {
            $data = [
                'title' => input('post.title'),
                'atop' => input('post.atop'),
                'cateid' => input('post.cateid'),
                'author' => $author,
                'tags' => input('post.tags'),
                'desc' => input('post.desc'),
                'content' => input('post.content')
            ];
            $result = model('Article')->add($data);
            if ($result == 1) {
                $this->success('图片添加成功！');
            }else {
                $this->error($result);
            }
        }
        $cates = model('Cate')->select();
        $viewData = [
            'cates' => $cates
        ];
        $this->assign($viewData);
        return view('m_articleadd');
    }

    public function articleSearch()
    {
        $keyword = '%' . input('keyword') . '%';
        $where[] = ['title', 'like', $keyword];
        $articles = model('Article')->where($where)->paginate(10, false, $where);
        $viewData = [
            'articles' => $articles,
            'catename' => '"' . input('keyword') . '"' . '搜索结果'
        ];
        $this->assign($viewData);
        return view('index/index');
    }

    public function articleMember()
    {
        $memberArticles = model('Article')->where('author', session('index.nickname'))->order('create_time', 'desc')->paginate(5);
        $viewData = [
            'articles' => $memberArticles,
            'catename' => '我的图片'
        ];
        $this->assign($viewData);
        return view('index/index');
    }

    public function articleComment()
    {
        $article_id = input('post.articleid');
        $data = [
            'content' => input('post.comment'),
            'articleid' => input('post.articleid'),
            'memberid' => session('index.id')
        ];
        $result = model('Comment')->add($data);
        if ($result == 1) {
            Db::name('article')->where('id', $article_id)->setInc('comment');
            $this->success('评论成功！');
        }else {
            $this->error($result);
        }
    }
}
