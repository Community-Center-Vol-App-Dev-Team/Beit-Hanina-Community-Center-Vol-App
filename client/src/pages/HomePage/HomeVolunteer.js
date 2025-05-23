import React from "react";
import { useTranslation } from "react-i18next";

// import components here
import EventItem from "../../components/EventItem";
import DynamicButton from "../../components/common/ButtonComponent";
import NavigationBar from "../../components/layout/NavigationBar";
import CopyRight from "../../components/layout/CopyRight";
// import orgLogo from "../../icons/org_icon.jpg"

const HomeVolunteer = () => {
  const { t } = useTranslation("home");

  const sortEvents = () => {
    console.log("Sort button clicked");
  };

  const renderEventItems = (eventsArray) => {
    return eventsArray.map((event, index) => (
      <EventItem
        key={index}
        name={event.name}
        desc={event.desc}
        req={event.req}
        className="flex-box flex-column event-box smooth-shadow-box"
        type="vol"
        count={event.count}
        size={event.size}
        eventLocation={event.eventLocation}
      />
    ));
  };

  return (
    <div className="app flex-box flex-column">
      <NavigationBar />

      <div className="scroll-box1 general-box flex-box flex-column">
        <div className="flex-box flex-column top-scroll-box1 line-break">
          <div>
            <DynamicButton
              className="button button-small"
              onClick={sortEvents}
              text={t("sort")}
            />
          </div>
        </div>
        <div className="bottom-scroll-box1">{renderEventItems(events)}</div>
        <CopyRight />
      </div>
    </div>
  );
};

export default HomeVolunteer;

//! temp data
const events = [
  {
    id: "event1",
    name: "تنظيف الحديقة العامة",
    desc: "حملة تنظيف وتجميل الحديقة العامة في بيت حنينا",
    req: ["التنظيف", "البستنة"],
    count: 5,
    size: 20,
    eventLocation: "الحديقة العامة - بيت حنينا",
  },
  {
    id: "event2",
    name: "دروس تقوية للطلاب",
    desc: "دروس تقوية في الرياضيات والعلوم لطلاب المدارس",
    req: ["التدريس", "الرياضيات", "العلوم"],
    count: 3,
    size: 10,
    eventLocation: "مركز المجتمع - بيت حنينا",
  },
  {
    id: "event3",
    name: "يوم رياضي للأطفال",
    desc: "تنظيم يوم رياضي ترفيهي للأطفال",
    req: ["الرياضة", "تنظيم الفعاليات"],
    count: 8,
    size: 15,
    eventLocation: "الملعب الرياضي - بيت حنينا",
  },
];
