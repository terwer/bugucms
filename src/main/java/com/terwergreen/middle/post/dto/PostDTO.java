package com.terwergreen.middle.post.dto;

import com.terwergreen.front.common.util.HtmlUtils;
import com.terwergreen.front.common.util.ImageUtils;
import com.terwergreen.front.common.util.MarkdownUtils;

import java.util.List;

public class PostDTO {
    /**
     * 文章ID
     */
    private int postId;
    /**
     * 文章别名
     */
    private String postSlug;
    /**
     * 文章标题
     */
    private String postTitle;
    /**
     * 文章内容
     */
    private String postContent;
    /**
     * 原始内容，数据库不保存
     */
    private String postRawContent;
    /**
     * 文章包含的图片，数据库不保存
     */
    private List<String> thumbnails;
    /**
     * 文章摘要，数据库不保存
     */
    private String postDesc;


    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public String getPostSlug() {
        return postSlug;
    }

    public void setPostSlug(String postSlug) {
        this.postSlug = postSlug;
    }

    public String getPostTitle() {
        return postTitle;
    }

    public void setPostTitle(String postTitle) {
        this.postTitle = postTitle;
    }

    public String getPostContent() {
        return postContent;
    }

    public void setPostContent(String postContent) {
        this.postRawContent = postContent;
        this.postContent = MarkdownUtils.md2html(postContent);
        this.thumbnails = ImageUtils.getImgSrc(this.getPostContent());
        this.postDesc = HtmlUtils.parseHtml(this.getPostContent(),320);
    }

    public String getPostRawContent() {
        return postRawContent;
    }

    public List<String> getThumbnails() {
        return thumbnails;
    }

    public String getPostDesc() {
        return postDesc;
    }
}
