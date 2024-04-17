; ModuleID = 'lowercase_unoptimized.ll'
source_filename = "lowercase.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticData = internal unnamed_addr constant [16 x i16] [i16 72, i16 69, i16 76, i16 76, i16 79, i16 32, i16 87, i16 79, i16 82, i16 76, i16 68, i16 33, i16 72, i16 69, i16 76, i16 76], align 16
@.str = private unnamed_addr constant [29 x i8] c"iterations (%ld characters)\0A\00", align 1

; Function Attrs: nofree noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr nocapture noundef readnone %1) local_unnamed_addr #0 {
  tail call fastcc void @doTest(i64 noundef 0)
  tail call fastcc void @doTest(i64 noundef 1)
  tail call fastcc void @doTest(i64 noundef 2)
  tail call fastcc void @doTest(i64 noundef 3)
  tail call fastcc void @doTest(i64 noundef 4)
  tail call fastcc void @doTest(i64 noundef 5)
  tail call fastcc void @doTest(i64 noundef 6)
  tail call fastcc void @doTest(i64 noundef 7)
  tail call fastcc void @doTest(i64 noundef 8)
  tail call fastcc void @doTest(i64 noundef 9)
  tail call fastcc void @doTest(i64 noundef 10)
  tail call fastcc void @doTest(i64 noundef 11)
  tail call fastcc void @doTest(i64 noundef 12)
  tail call fastcc void @doTest(i64 noundef 13)
  tail call fastcc void @doTest(i64 noundef 14)
  tail call fastcc void @doTest(i64 noundef 15)
  tail call fastcc void @doTest(i64 noundef 16)
  tail call fastcc void @doTest(i64 noundef 17)
  tail call fastcc void @doTest(i64 noundef 18)
  tail call fastcc void @doTest(i64 noundef 19)
  tail call fastcc void @doTest(i64 noundef 20)
  tail call fastcc void @doTest(i64 noundef 21)
  tail call fastcc void @doTest(i64 noundef 22)
  tail call fastcc void @doTest(i64 noundef 23)
  tail call fastcc void @doTest(i64 noundef 24)
  tail call fastcc void @doTest(i64 noundef 25)
  tail call fastcc void @doTest(i64 noundef 26)
  tail call fastcc void @doTest(i64 noundef 27)
  tail call fastcc void @doTest(i64 noundef 28)
  tail call fastcc void @doTest(i64 noundef 29)
  tail call fastcc void @doTest(i64 noundef 30)
  tail call fastcc void @doTest(i64 noundef 31)
  ret i32 0
}

; Function Attrs: nofree noinline nounwind uwtable
define internal fastcc void @doTest(i64 noundef %0) unnamed_addr #0 {
  %2 = add nsw i64 %0, 15
  %3 = and i64 %2, -16
  %4 = shl nuw nsw i64 %3, 1
  %5 = tail call ptr @malloc(i64 noundef %4) #7
  br label %6

6:                                                ; preds = %8, %1
  %.0 = phi i64 [ 0, %1 ], [ %10, %8 ]
  %7 = icmp ult i64 %.0, %3
  br i1 %7, label %8, label %11

8:                                                ; preds = %6
  %9 = getelementptr inbounds i16, ptr %5, i64 %.0
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 2 dereferenceable(32) %9, ptr noundef nonnull align 16 dereferenceable(32) @staticData, i64 32, i1 false)
  %10 = add nuw nsw i64 %.0, 16
  br label %6, !llvm.loop !6

11:                                               ; preds = %6
  %calloc = tail call ptr @calloc(i64 1, i64 %4)
  %12 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i64 noundef %0, i64 noundef %0)
  br label %13

13:                                               ; preds = %14, %11
  %.1 = phi i64 [ 0, %11 ], [ %15, %14 ]
  %exitcond.not = icmp eq i64 %.1, 10000000
  br i1 %exitcond.not, label %16, label %14

14:                                               ; preds = %13
  tail call fastcc void @lower_StringImpl(ptr noundef %5, i64 noundef %0, ptr noundef %calloc)
  %15 = add nuw nsw i64 %.1, 1
  br label %13, !llvm.loop !8

16:                                               ; preds = %13
  ret void
}

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite)
declare noalias noundef ptr @malloc(i64 noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #3

; Function Attrs: nofree noinline norecurse nosync nounwind memory(argmem: readwrite) uwtable
define internal fastcc void @lower_StringImpl(ptr noalias nocapture noundef readonly %0, i64 noundef %1, ptr noalias nocapture noundef writeonly %2) unnamed_addr #4 {
  br label %4

4:                                                ; preds = %5, %3
  %.011 = phi i64 [ 0, %3 ], [ %10, %5 ]
  %exitcond.not = icmp eq i64 %.011, %1
  br i1 %exitcond.not, label %11, label %5

5:                                                ; preds = %4
  %6 = getelementptr inbounds i16, ptr %0, i64 %.011
  %7 = load i16, ptr %6, align 2
  %8 = tail call fastcc zeroext i16 @toASCIILower(i16 noundef zeroext %7)
  %9 = getelementptr inbounds i16, ptr %2, i64 %.011
  store i16 %8, ptr %9, align 2
  %10 = add nuw i64 %.011, 1
  br label %4, !llvm.loop !9

11:                                               ; preds = %4
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(none) uwtable
define internal fastcc zeroext i16 @toASCIILower(i16 noundef zeroext %0) unnamed_addr #5 {
  %2 = add i16 %0, -65
  %3 = icmp ult i16 %2, 26
  %4 = select i1 %3, i16 32, i16 0
  %5 = or i16 %4, %0
  ret i16 %5
}

; Function Attrs: nofree nounwind willreturn allockind("alloc,zeroed") allocsize(0,1) memory(inaccessiblemem: readwrite)
declare noalias noundef ptr @calloc(i64 noundef, i64 noundef) local_unnamed_addr #6

attributes #0 = { nofree noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { nofree nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree noinline norecurse nosync nounwind memory(argmem: readwrite) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress nofree noinline norecurse nosync nounwind willreturn memory(none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nofree nounwind willreturn allockind("alloc,zeroed") allocsize(0,1) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" }
attributes #7 = { allocsize(0) }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.6"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
