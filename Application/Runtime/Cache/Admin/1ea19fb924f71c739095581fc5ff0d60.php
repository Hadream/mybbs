<?php if (!defined('THINK_PATH')) exit();?>
 	
		<!--内容部分start-->
		<div class="content">		
            <!--分区部分start-->
            <?php foreach($parts as $part): ?>
            <div class="section">
                
                <!--分区标题部分start-->
                <div class="section_title">
                  <span class="section_title_left"><?=$part['pname']?></span>
                  <span class="section_title_right">分区版主：<a href="">哈哈</a></span>
                </div>
                <!--分区标题部分end-->
                
                <!--分区内容部分start-->
                <?php foreach($part['sub'] as $k=>$cate): ?>
                <div class="section_content">
                  <table cellspacing="0" celpadding="0">
                    <tr>
                      <td width="33%">
                        <span class="section_content_ico">
                          <img src="/Public/Home/images/forum_new.gif" title="Discuz!程序发布" />
                        </span>
                        <dl>
                          <dd class="dd_title"><a href="/index.php?m=home&c=post&index&cid=<?=$cate['cid']?>"><?=$cate[cname]?></a></dd>
                          <dd>
                            <em>主题：54</em>,
                            <em>帖子：244</em>
                          </dd>
                          <dd>
                            <a href="">最后发表: 2012-11-1 10:22</a>
                          </dd>
                        </dl>
                      </td>
                    </tr>		
                  </table>
                </div>
                <?php endforeach; ?>
                <!--分区内容部分end-->
            </div>
            <?php endforeach; ?>
            <!--分区部分end-->          
        </div>
        <!--内容部分end-->