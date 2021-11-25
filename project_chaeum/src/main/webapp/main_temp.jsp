<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
  <!-- Vendor CSS Files 



     
  -->
  
       <link href="resources/assets/vendor/aos/aos.css" rel="stylesheet">
     <link href="resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">

  <link href="resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  <!-- Template Main CSS File -->
  <link href="resources/assets/css/style.css" rel="stylesheet">
</head>

  <!-- ======= Hero Section ======= -->
  <section id="hero" class="clearfix">
    <div class="container d-flex h-100">
      <div class="row justify-content-center align-self-center" data-aos="fade-up">
        <div class="col-lg-6 intro-info order-lg-first order-last" data-aos="zoom-in" data-aos-delay="100">
          <h2>Welcome To Our Chaeum! <br>STUDY ROOM & STUDY HOLL <span>Reservation</span></h2>
          <div>
            <a href="#pricing" class="btn-get-started scrollto" href="#" onclick="location.href='getBranchList.do'">now!</a>
          </div>
        </div>

        <div class="col-lg-6 intro-img order-lg-last order-first" data-aos="zoom-out" data-aos-delay="200">
          <img src="resources/assets/img/about2.jpg" alt="" class="img-fluid">
        </div>
      </div>

    </div>
  </section><!-- End Hero -->


  <main id="main">

    <!-- ======= About Section ======= -->
    <section id="about" class="about">

      <div class="container" data-aos="fade-up">
        <div class="row">

          <div class="col-lg-5 col-md-6">
            <div class="about-img" data-aos="fade-right" data-aos-delay="100">
              <img src="resources/assets/img/cabout.jpg" alt="">
            </div>
          </div>

          <div class="col-lg-7 col-md-6">
            <div class="about-content" data-aos="fade-left" data-aos-delay="100">
              <h2>“학습환경은 과학이다!”</h2>
              <h3> Chaeum 에서는 4가지 핵심서비스로 학습 집중도를 높일 수 있는 시스템을 갖추었습니다</h3><br>
              <p>더스터디는 기존 카페들과 차별화를 통해
             학생들에게는 최적의 학습 목표를 달성하고, 취업 준비생에게는 성공적인 취업을 달성할 수 있도록 도움을 드리는 최고의 공간입니다</p>
              <ul>
                <li><i class="bi bi-check-circle"></i>첫째, 산소발생시스템 구축 집중된 공간에서는 산소 부족 및 이산화탄소 증가로 인한 집중력 결핍 및 안구 건조, 이명 같은 증상이 발생될 수 있습니다. 이러한 단점으로 보완하기위해 신선한 산소을 공급하기 위해 산소발생시스템을 설치하였습니다</li>
                <li><i class="bi bi-check-circle"></i> 둘째, 공기청정시스템 구축 요즘 이슈화된 중국발 미세 먼지 및 냄새 등으로 카페와 같은 밀폐된 공간에서의 오염도가 타 장소에 비해 수치가 매우 높습니다. 이러한 공간에서 오랜 학습을 하다보면 두통 및 집중력 결핍과 같은  증상이 발생 될 수 있어, 이를 예방하고자 공기청정시스템으로 맑은 공기를 유지하고 있습니다.</li>
                <li><i class="bi bi-check-circle"></i> 셋째, 백색소음시스템 구축 시험기간에 밤새 공부를 하다 보면 순간 집중이 전혀 되지 않은 시기가 있습니다. 많은 공부거리 때문에 지쳐버린 머릿속때문입니다. 이럴때 백색소음을 청취하며 공부를 하게 되면 집중력을 향상 시킬수있으며 또한 스트레스도 해소 할 수 있는일석이조 효과를 보실 수 있습니다</li>
                <li><i class="bi bi-check-circle"></i>넷째, LED시스템 구축 수은, co2등의 위험물질을 사용하지 않으며, 사용시 자외선 및 적외선이 방출되지 않아 건강에 좋습니다. 또한 눈부심과 떨림 현상이 없음으로 장시간 사용에도 눈의 피로감을 덜느끼게 됩니다.</li>
              </ul>
            </div>
          </div>
        </div>
      </div>

    </section><!-- End About Section -->

    <!-- ======= Services Section ======= -->
    <section id="services" class="services section-bg">
      <div class="container" data-aos="fade-up">

        <header class="section-header">
          <h3>커뮤니티</h3>
          <p>커뮤니티 게시판입니다.</p>
        </header>

        <div class="row">

          <div class="col-md-6 col-lg-4 wow bounceInUp" data-aos="zoom-in" data-aos-delay="100">
            <div class="box">
              <div class="icon" style="background: #fceef3;"><i class="bi bi-calendar4-week" style="color: #ff689b;"></i></div>
              <h4 class="title"><a href="#" onclick="location.href='getNoticeBoardList.do'">공지사항</a></h4>
              <p class="description">채움을 이용하실 때 필요한 공지를 업로드하는 공간입니다.</p>
            </div>
          </div>
          <div class="col-md-6 col-lg-4" data-aos="zoom-in" data-aos-delay="200">
            <div class="box">
              <div class="icon" style="background: #fff0da;"><i class="bi bi-card-checklist" style="color: #e98e06;"></i></div>
              <h4 class="title"><a href="#about" onclick="location.href='getFreeBoardList.do'">자유게시판</a></h4>
              <p class="description">회원들끼리 자유롭게 소통하는 공간입니다.</p>
            </div>
          </div>

          <div class="col-md-6 col-lg-4" data-aos="zoom-in" data-aos-delay="300">
            <div class="box">
              <div class="icon" style="background: #e6fdfc;"><i class="bi bi-card-checklist" style="color: #3fcdc7;"></i></div>
              <h4 class="title"><a href="#" onclick="location.href='message_list.do'">채움 Talk</a></h4>
              <p class="description">채움을 이용하실때 불편한점이나 궁금한점이 있으실 때 작성하는 공간입니다.</p>
            </div>
          </div>
		</div>
		</div>
	</section>
    <!-- ======= 위치안내 Section ======= 
    <section id="call-to-action" class="call-to-action"  >
      <div class="container" data-aos="zoom-out" >
        <div class="row">
          <div class="col-lg-9 text-center text-lg-start">
            <h3 class="cta-title" align=left>위치안내</h3>
            <p class="cta-text" align=left> cheaum 본점<br>[주소]<br>우편번호 : 02842신주소: 서울특별시 성북구 개운사길 5 세한빌딩 4층구주소: 서울특별시 성북구 안암동5가 101-19 세한빌딩 4층<br>[교통]<br>지하철: 6호선 안암역 2번출구 1분거리버스: 간선 273, 지선 1111, 마을 04 <br>[찾아오시는방법]<br>6호선 안암역 2번출구로 나와 반대 방향으로 10미터 나오시면 국민은행 건물 4층에 위치하고 있습니다</p>
          </div>
          <div class="col-lg-3 cta-btn-container text-center">
            <a class="cta-btn align-middle" href="#">지도 자세히 보기</a>
          </div>
        </div>

      </div>
    </section>--><!--  End Call To Action Section -->

    <!-- ======= 스터디룸,스터디홀 예약 전 이용안내 ======= -->
    <section id="features" class="features">
      <div class="container" data-aos="fade-up">

        <div class="row feature-item">
          <div class="col-lg-6" data-aos="fade-right" data-aos-delay="100">
            <img src="resources/assets/img/about5.jpg" class="img-fluid" alt="">
          </div>
          <div class="col-lg-6 wow fadeInUp pt-5 pt-lg-0" data-aos="fade-left" data-aos-delay="150">
            <h4>studyroom & studyhall 이용안내</h4>
            <br>
            <p> studyroom과 studyhall은 A타입,B타입,C타입로 구성되어 있으며 자유롭게 이동하여 이용 가능합니다.</p>                                                                          
            <p>[studyroom & studyhall 예약] <br>인터넷 예약 :  www.thestudy.kr/reservation 실시간 예약 선택 <br>전화예약 : 010-9123-8123 , 02-925-2225</p>
            <ul>
            <li>studyroom & studyhall은 예약을 하셔야 이용할 수 있는 공간입니다 <홈페이지 및 전화 02-925-2225> </li>
            <li>studyroom & studyhall 이용시 5분전 입실, 5분전 퇴실을 준수바랍니다.</li>
            <li>studyroom & studyhall 이용중 시간 연장이 필요하시면 관리자에게 문의 하시기 바랍니다.</li>              <li>각호실마다 최소 이용시간은 2시간이며, 그 이후 연장 시간 단위는 1시간 단위입니다.</li>                       </ul>                                                                                       </p> 
            <p>[이용규정]<br>* STDUY ROOM 예약 환불 규정<br> - 이용시간에서 하루이상 남았을 경우( 80% 환불)<br>- 이용시간에서  3시간 ~ 24시간전 50% 환불<br> - 이용시간에서  0시간 ~ 3시간전 환불불가<br> 모든이용권은 환불이 불가합니다.기간권은 양도 1회 한해서 가능합니다.(수수료 10%별도)사물함 환불 및 양도 불가합니다.</p>                                                                                        
        </div>

        <div class="row feature-item mt-5 pt-5">
          <div class="col-lg-6 wow fadeInUp order-1 order-lg-2" data-aos="fade-left" data-aos-delay="100">
            <img src="resources/assets/img/about6.jpg" class="img-fluid" alt="">
          </div>

          <div class="col-lg-6 wow fadeInUp pt-4 pt-lg-0 order-2 order-lg-1" data-aos="fade-right" data-aos-delay="150">
            <h4>studyroom & studyhall 이용금액 안내</h4>
            <br>
            <p>[이용금액]<br>최소이용시간은 2시간이며, 이용요금은 1인 1시간당 2,000원 (단, 2인 사용시 1인 1시간 2,500원)</p> 
            <p>[일반권]<br> 1. 2시간 이용권 - 3,000원, 3시간 이용권 - 4,000원, 4시간 이용권 - 4,500원, 6시간 이용권 - 6,000원, 8시간 이용권 - 7,500원, 10시간 이용권 - 9,000원, 12시간 이용권 - 10,000원</p>
            <p>[정액권]<br>20시간 이용권(유효기간 40일) - 30,000원, 30시간 이용권(유효기간 60일) - 45,000원, 50시간 이용권(유효기간 80일) - 60,000원, 100시간 이용권(유효기간 120일) - 110,000원, 150시간 이용권(유효기간 150일) - 160,000원, 200시간 이용권(유효기간 180일) - 200,000원</p>
            <p>[사물함]<br> 2주- 10,000원, 4주- 15,000원</p>
            <p>[기타 이용금액]<br> 노트북대여 - 1시간 2,000원(사전예약), 인쇄 및 복사 - 흑백 : 장당 50원, 컬러 장당 200원, 스캔 - 장당 200원, 사물함대여 - 유료 월 25,000원 </p>                                                   
          </div>

        </div>

      </div>
      </div>
    </section><!-- End Features Section -->

    <!-- ======= Section 시설안내======= -->
    <section id="portfolio" class="portfolio section-bg">
      <div class="container" data-aos="fade-up">

        <header class="section-header">
          <h3 class="section-title">시설안내</h3>
        </header>

        <div class="row" data-aos="fade-up" data-aos-delay="100">
          <div class="col-lg-12">
            <ul id="portfolio-flters">
              <li data-filter="*" class="filter-active">All</li>
              <li data-filter=".filter-app">Studyroom</li>
              <li data-filter=".filter-card">Studyhall</li>
              <li data-filter=".filter-web">Lounge</li> 
            </ul>
          </div>
        </div>

        <div class="row portfolio-container" data-aos="fade-up" data-aos-delay="200">

          <div class="col-lg-4 col-md-6 portfolio-item filter-app">
            <div class="portfolio-wrap">
              <img src="resources/assets/img/portfolio/app1.jpg" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4><a href="portfolio-details.html">Studyroom</a></h4>
                <p>A 타입</p>
                <div>
                  <a href="resources/assets/img/portfolio/app1.jpg" data-gallery="portfolioGallery" title="A 타입의 Studyroom 입니다 눈의 피로도를 줄여주는 색상으로 보다 편안하게 집중 할 수 있는 장점이 있습니다." class="link-preview portfolio-lightbox"><i class="bi bi-plus"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-web" data-wow-delay="0.1s">
            <div class="portfolio-wrap">
              <img src="resources/assets/img/portfolio/web3.jpg" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4><a href="portfolio-details.html">Lounge</a></h4>
                <p>C 타입</p>
                <div>
                  <a href="resources/assets/img/portfolio/web3.jpg" class="link-preview portfolio-lightbox" data-gallery="portfolioGallery" title="C 타입의 Lounge 입니다 프린트,스캔을 할 수 있는 공간입니다."><i class="bi bi-plus"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-app" data-wow-delay="0.2s">
            <div class="portfolio-wrap">
              <img src="resources/assets/img/portfolio/app2.jpg" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4><a href="portfolio-details.html">Studyroom</a></h4>
                <p>B 타입</p>
                <div>
                  <a href="resources/assets/img/portfolio/app2.jpg" class="link-preview portfolio-lightbox" data-gallery="portfolioGallery" title="B 타입의 Studyroom 입니다 낮은 칸막이로 답답함을 줄였습니다."><i class="bi bi-plus"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-card">
            <div class="portfolio-wrap">
              <img src="resources/assets/img/portfolio/card2.jpg" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4><a href="portfolio-details.html">Studyhall</a></h4>
                <p>B 타입</p>
                <div>
                  <a href="resources/assets/img/portfolio/card2.jpg" class="link-preview portfolio-lightbox" data-gallery="portfolioGallery" title="Card 2"><i class="bi bi-plus"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-web" data-wow-delay="0.1s">
            <div class="portfolio-wrap">
              <img src="resources/assets/img/portfolio/web2.jpg" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4><a href="portfolio-details.html">Lounge</a></h4>
                <p>B 타입</p>
                <div>
                  <a href="resources/assets/img/portfolio/web2.jpg" class="link-preview portfolio-lightbox" data-gallery="portfolioGallery" title="Web 2"><i class="bi bi-plus"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-app" data-wow-delay="0.2s">
            <div class="portfolio-wrap">
              <img src="resources/assets/img/portfolio/app3.jpg" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4><a href="portfolio-details.html">Studyroom</a></h4>
                <p>C 타입</p>
                <div>
                  <a href="resources/assets/img/portfolio/app3.jpg" class="link-preview portfolio-lightbox" data-gallery="portfolioGallery" title="C 타입의 Studyroom 입니다 컴퓨터가 있어 강의를 들을 때나 작업을 할때 유용하게 사용 가능합니다."><i class="bi bi-plus"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-card">
            <div class="portfolio-wrap">
              <img src="resources/assets/img/portfolio/card1.jpg" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4><a href="portfolio-details.html">Studyhall</a></h4>
                <p>A 타입</p>
                <div>
                  <a href="resources/assets/img/portfolio/card1.jpg" class="link-preview portfolio-lightbox" data-gallery="portfolioGallery" title="Card 1"><i class="bi bi-plus"></i></a>
                  <a href="portfolio-details.html" class="link-details" title="More Details"><i class="bi bi-link"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-card" data-wow-delay="0.1s">
            <div class="portfolio-wrap">
              <img src="resources/assets/img/portfolio/card3.jpg" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4><a href="portfolio-details.html">Studyhall</a></h4>
                <p>C 타입</p>
                <div>
                  <a href="resources/assets/img/portfolio/card3.jpg" class="link-preview portfolio-lightbox" data-gallery="portfolioGallery" title="Card 3"><i class="bi bi-plus"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-web" data-wow-delay="0.2s">
            <div class="portfolio-wrap">
              <img src="resources/assets/img/portfolio/web1.jpg" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4><a href="portfolio-details.html">Lounge</a></h4>
                <p>A 타입</p>
                <div>
                  <a href="resources/assets/img/portfolio/web1.jpg" class="link-preview portfolio-lightbox" data-gallery="portfolioGallery" title="Web 1"><i class="bi bi-plus"></i></a>
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>
    </section><!-- End Portfolio Section -->



    <!-- ======= 실시간예약 Section ======= 
    <section id="pricing" class="pricing section-bg wow fadeInUp">

      <div class="container" data-aos="fade-up">

        <header class="section-header">
          <h3>실시간예약</h3>
          <p>Studyroom과 Studyhall은 각각 A타입,B타입,C 타입으로 구성 되어 있으며, 자유롭게 이동하여 이용 가능합니다.</p>
        </header>

        <div class="row flex-items-xs-middle flex-items-xs-center">

         
          <div class="col-lg-6 col-lg-4" data-aos="fade-up" data-aos-delay="100">
            <div class="card">
              <div class="card-header">
                <h3><span class="currency">1시간</span>2,000<span class="period">/원</span></h3>
              </div>
              <div class="card-block">
                <h4  id="studyroom" class="card-title">
                  studyroom 예약
                </h4>
                <ul class="list-group">
                  <li class="list-group-item">최소이용시간은 2시간이며</li>
                  <li class="list-group-item">이용요금은 1인 1시간당 2,000원</li>
                  <li class="list-group-item">(단, 2인 사용시 1인 1시간 2,500원)</li>
                  <li class="list-group-item">일반권, 정액권 두가지 방법으로 구매가능</li>
                </ul>

                <a href="#" class="btn">reservation </a>
              </div>
            </div>
          </div>

       
          <div class="col-lg-6 col-lg-4" data-aos="fade-up" data-aos-delay="200">
            <div class="card">
              <div class="card-header">
                <h3><span class="currency">1시간</span>2,000<span class="period">/원</span></h3>
              </div>
              <div class="card-block">
                <h4 id="studyhall" class="card-title">
                  studyhall 예약
                </h4>
                 <ul class="list-group">
                  <li class="list-group-item">최소이용시간은 2시간이며</li>
                  <li class="list-group-item">이용요금은 1인 1시간당 2,000원</li>
                  <li class="list-group-item">(단, 2인 사용시 1인 1시간 2,500원)</li>
                  <li class="list-group-item">일반권, 정액권 두가지 방법으로 구매가능</li>
                </ul>
                <a href="#" class="btn">reservation </a>
              </div>
            </div>
          </div>
        </div>
      </div>

    </section>
-->
    <!--이용안내 
    <section id="faq" class="faq">
      <div class="container" data-aos="fade-up">
        <header class="section-header">
          <h3>CHEAUM 이용안내</h3>
          <p>채움을 이용하실때 참고해주세요</p>
        </header>

        <ul class="faq-list" data-aso="fade-up" data-aos-delay="100">

          <li>
            <div data-bs-toggle="collapse" class="collapsed question" href="#faq1">영업시간<i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
            <div id="faq1" class="collapse" data-bs-parent=".faq-list">
              <p>
               연중 무휴 24시간 영업 
              </p>
            </div>
          </li>

          <li>
            <div data-bs-toggle="collapse" href="#faq2" class="collapsed question">이용구분<i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
            <div id="faq2" class="collapse" data-bs-parent=".faq-list">
              <p>
                더스터디는 스터디홀과 스터디룸으로 구분되어 있습니다.
              </p>
            </div>
          </li>
          <li>
            <div data-bs-toggle="collapse" href="#faq3" class="collapsed question">음료서비스<i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
            <div id="faq3" class="collapse" data-bs-parent=".faq-list">
              <p>
                아메리카노 ICE/HOT 및 여러가지 TEA를 즐기실 수 있습니다.
              </p>
            </div>
          </li>

          <li>
            <div data-bs-toggle="collapse" href="#faq4" class="collapsed question">그외 서비스<i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
            <div id="faq4" class="collapse" data-bs-parent=".faq-list"><br><br>
              <ul>
               <li>각 테이블에 콘센트, 개별 조명 설치</li>
               <li>인쇄 및 복사, 팩스, 스캔은 유료로 이용 가능</li>
               <li>사물함, 무릎담요 무료대여</li>
               <li>GIGA WIFI 무료 사용</li>
              </ul>
            </div>
          </li>
          <li>
            <div data-bs-toggle="collapse" href="#faq5" class="collapsed question">이용규정<i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
            <div id="faq5" class="collapse" data-bs-parent=".faq-list"><br><br>
              <ul>
               <li>외부음식 반입 불가</li>
               <li>핸드폰 통화 등 지나친 소음은 삼가해주세요</li>
               <li>커플 고객은 애정표현을 삼가해주시기 바랍니다.</li>
               <li>개인소지품 분실, 도난시 책임지지 않습니다</li>
               <li>외출시에도 요금은 적용됩니다</li>
              </ul>
            </div>
          </li>
        </ul>
                                                                        
      </div>
    </section>-->
</main>


