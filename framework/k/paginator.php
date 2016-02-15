<?php
class K_Paginator{
    
     // Вспомогательный метод - используеться перед запросом
    public static function prepear($page, $onPage)
    {

        if (!$onPage) {

            $onPage = 20;

        }

        if ($page) {

            $start = $page * $onPage - $onPage;

        } else {

            $start = 0;
            $page = 1;

        }

        return array(
            'start' => $start,
            'page' => $page,
            'onPage' => $onPage
        );
    }

    public static function simple( $page, $cntPages, $url, $class = null ) {
        $per = 7;

        if ($cntPages <= 1) return '';

        $html = '<div class="paginator">';

        $html .= '<ul>';
        if ( $page > 1 ) {
            if ($page == 2){
                $link = preg_replace('/[&|?]page={#}/', '', $url);
            } else {
                $link = str_replace('{#}', ($page-1), $url);
            }
            $html .= '<a href="'.$link.'" ><li class="sprite pag-arr"></li></a>';
            K_SEO::setPrev($link);
        } else {
            $html .= '';
        }


        for ( $i=0; $i<$per; ++$i ) {
            $index = $page - 2 + $i;
            if ( $index >= 1 && $index <= $cntPages ) {

                if ($index == 1){
                    $link = preg_replace('/[&|?]page={#}/', '', $url);
                } else {
                    $link = str_replace('{#}', ($index), $url);
                }
                if($index==$page){

                    $html .= '<a href="'.$link.'"><li class="active">'.($index).'</li></a>';

                }else{

                    $html .= '<a href="'.$link.'"><li>'.($index).'</li></a>';

                }

            }
        }

        if ( $page > 0 && $page < $cntPages ) {
            $link = str_replace('{#}', ($page+1), $url);
            $html .= '<a href="'.$link.'" ><li class="sprite pag-arr right"></li></a>';
            K_SEO::setNext($link);
        } else {
            $html .= '';
        }
        $html .= '</ul>';

        $html .= '<div class="clear"></div></div>';
        return $html;
    }
}


?>