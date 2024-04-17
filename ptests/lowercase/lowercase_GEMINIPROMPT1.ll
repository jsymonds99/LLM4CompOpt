; ModuleID = 'lowercase_unoptimized.ll'
source_filename = "lowercase.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticData = internal unnamed_addr constant [16 x i16] [i16 72, i16 69, i16 76, i16 76, i16 79, i16 32, i16 87, i16 79, i16 82, i16 76, i16 68, i16 33, i16 72, i16 69, i16 76, i16 76], align 16
@.str = private unnamed_addr constant [29 x i8] c"iterations (%ld characters)\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr nocapture noundef readnone %1) local_unnamed_addr #0 {
  call fastcc void @doTest(i64 noundef 0)
  call fastcc void @doTest(i64 noundef 1)
  call fastcc void @doTest(i64 noundef 2)
  call fastcc void @doTest(i64 noundef 3)
  call fastcc void @doTest(i64 noundef 4)
  call fastcc void @doTest(i64 noundef 5)
  call fastcc void @doTest(i64 noundef 6)
  call fastcc void @doTest(i64 noundef 7)
  call fastcc void @doTest(i64 noundef 8)
  call fastcc void @doTest(i64 noundef 9)
  call fastcc void @doTest(i64 noundef 10)
  call fastcc void @doTest(i64 noundef 11)
  call fastcc void @doTest(i64 noundef 12)
  call fastcc void @doTest(i64 noundef 13)
  call fastcc void @doTest(i64 noundef 14)
  call fastcc void @doTest(i64 noundef 15)
  call fastcc void @doTest(i64 noundef 16)
  call fastcc void @doTest(i64 noundef 17)
  call fastcc void @doTest(i64 noundef 18)
  call fastcc void @doTest(i64 noundef 19)
  call fastcc void @doTest(i64 noundef 20)
  call fastcc void @doTest(i64 noundef 21)
  call fastcc void @doTest(i64 noundef 22)
  call fastcc void @doTest(i64 noundef 23)
  call fastcc void @doTest(i64 noundef 24)
  call fastcc void @doTest(i64 noundef 25)
  call fastcc void @doTest(i64 noundef 26)
  call fastcc void @doTest(i64 noundef 27)
  call fastcc void @doTest(i64 noundef 28)
  call fastcc void @doTest(i64 noundef 29)
  call fastcc void @doTest(i64 noundef 30)
  call fastcc void @doTest(i64 noundef 31)
  ret i32 0
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @doTest(i64 noundef %0) unnamed_addr #0 {
  %2 = add nuw nsw i64 %0, 15
  %3 = and i64 %2, -16
  %4 = shl nuw nsw i64 %3, 1
  %5 = call ptr @malloc(i64 noundef %4) #7
  br label %6

6:                                                ; preds = %8, %1
  %storemerge = phi i64 [ 0, %1 ], [ %10, %8 ]
  %7 = icmp ult i64 %storemerge, %3
  br i1 %7, label %8, label %11

8:                                                ; preds = %6
  %9 = shl nuw i64 %storemerge, 1
  %scevgep = getelementptr i8, ptr %5, i64 %9
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 2 dereferenceable(32) %scevgep, ptr noundef nonnull align 16 dereferenceable(32) @staticData, i64 32, i1 false)
  %10 = add nuw nsw i64 %storemerge, 16
  br label %6, !llvm.loop !6

11:                                               ; preds = %6
  %12 = call ptr @malloc(i64 noundef %4) #7
  %13 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i64 noundef %0, i64 noundef %0) #8
  call void @llvm.memset.p0.i64(ptr align 2 %12, i8 0, i64 %4, i1 false)
  br label %14

14:                                               ; preds = %15, %11
  %lsr.iv = phi i64 [ %lsr.iv.next, %15 ], [ 10000000, %11 ]
  %exitcond = icmp ne i64 %lsr.iv, 0
  br i1 %exitcond, label %15, label %17

15:                                               ; preds = %14
  %16 = call fastcc i64 @lower_StringImpl(ptr noundef %5, i64 noundef %0, ptr noundef %12), !range !8
  %lsr.iv.next = add nsw i64 %lsr.iv, -1
  br label %14, !llvm.loop !9

17:                                               ; preds = %14
  ret void
}

; Function Attrs: allocsize(0)
declare ptr @malloc(i64 noundef) local_unnamed_addr #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

declare i32 @printf(ptr noundef, ...) local_unnamed_addr #3

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nofree noinline norecurse nosync nounwind memory(argmem: readwrite) uwtable
define internal fastcc i64 @lower_StringImpl(ptr noalias nocapture noundef readonly %0, i64 noundef %1, ptr noalias nocapture noundef writeonly %2) unnamed_addr #5 {
  br label %4

4:                                                ; preds = %5, %3
  %.0 = phi i16 [ 0, %3 ], [ %8, %5 ]
  %storemerge = phi i64 [ 0, %3 ], [ %10, %5 ]
  %exitcond = icmp ne i64 %1, %storemerge
  br i1 %exitcond, label %5, label %11

5:                                                ; preds = %4
  %6 = shl i64 %storemerge, 1
  %scevgep = getelementptr i8, ptr %0, i64 %6
  %7 = load i16, ptr %scevgep, align 2
  %8 = or i16 %.0, %7
  %9 = call fastcc zeroext i16 @toASCIILower(i16 noundef zeroext %7)
  %scevgep2 = getelementptr i8, ptr %2, i64 %6
  store i16 %9, ptr %scevgep2, align 2
  %10 = add nuw i64 %storemerge, 1
  br label %4, !llvm.loop !10

11:                                               ; preds = %4
  %.0.lcssa = phi i16 [ %.0, %4 ]
  %.not = icmp ult i16 %.0.lcssa, 128
  %. = select i1 %.not, i64 1, i64 0
  ret i64 %.
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(none) uwtable
define internal fastcc zeroext i16 @toASCIILower(i16 noundef zeroext %0) unnamed_addr #6 {
  %2 = icmp ugt i16 %0, 64
  %3 = icmp ult i16 %0, 91
  %4 = select i1 %3, i16 32, i16 0
  %5 = select i1 %2, i16 %4, i16 0
  %6 = or i16 %5, %0
  ret i16 %6
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #5 = { nofree noinline norecurse nosync nounwind memory(argmem: readwrite) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { mustprogress nofree noinline norecurse nosync nounwind willreturn memory(none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind allocsize(0) }
attributes #8 = { nounwind }

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
!8 = !{i64 0, i64 2}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
