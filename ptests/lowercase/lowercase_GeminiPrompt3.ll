; ModuleID = 'lowercase_unoptimized.ll'
source_filename = "lowercase.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticData = internal global [16 x i16] [i16 72, i16 69, i16 76, i16 76, i16 79, i16 32, i16 87, i16 79, i16 82, i16 76, i16 68, i16 33, i16 72, i16 69, i16 76, i16 76], align 16
@.str = private unnamed_addr constant [29 x i8] c"iterations (%ld characters)\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  br label %3

3:                                                ; preds = %5, %2
  %4 = phi i64 [ 0, %2 ], [ %6, %5 ]
  %exitcond = icmp ne i64 %4, 32
  br i1 %exitcond, label %5, label %7

5:                                                ; preds = %3
  tail call void @doTest(i64 noundef %4)
  %6 = add nuw nsw i64 %4, 1
  br label %3, !llvm.loop !6

7:                                                ; preds = %3
  ret i32 0
}

; Function Attrs: noinline nounwind uwtable
define internal void @doTest(i64 noundef %0) #0 {
  %2 = add i64 %0, 15
  %3 = and i64 %2, -16
  %4 = shl i64 %3, 1
  %5 = tail call ptr @malloc(i64 noundef %4) #7
  br label %6

6:                                                ; preds = %9, %1
  %7 = phi i64 [ 0, %1 ], [ %11, %9 ]
  %8 = icmp ult i64 %7, %3
  br i1 %8, label %9, label %12

9:                                                ; preds = %6
  %10 = getelementptr inbounds i16, ptr %5, i64 %7
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 2 dereferenceable(32) %10, ptr noundef nonnull align 16 dereferenceable(32) @staticData, i64 32, i1 false)
  %11 = add nuw i64 %7, 16
  br label %6, !llvm.loop !8

12:                                               ; preds = %6
  %13 = tail call ptr @malloc(i64 noundef %4) #7
  %14 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i64 noundef %0, i64 noundef %0) #8
  tail call void @llvm.memset.p0.i64(ptr align 2 %13, i8 0, i64 %4, i1 false)
  br label %15

15:                                               ; preds = %17, %12
  %16 = phi i64 [ 0, %12 ], [ %19, %17 ]
  %exitcond = icmp ne i64 %16, 10000000
  br i1 %exitcond, label %17, label %20

17:                                               ; preds = %15
  %18 = tail call i64 @lower_StringImpl(ptr noundef %5, i64 noundef %0, ptr noundef %13)
  %19 = add nuw nsw i64 %16, 1
  br label %15, !llvm.loop !9

20:                                               ; preds = %15
  ret void
}

; Function Attrs: allocsize(0)
declare ptr @malloc(i64 noundef) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nofree noinline norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define internal i64 @lower_StringImpl(ptr noalias noundef %0, i64 noundef %1, ptr noalias noundef %2) #5 {
  br label %4

4:                                                ; preds = %7, %3
  %5 = phi i16 [ 0, %3 ], [ %10, %7 ]
  %6 = phi i64 [ 0, %3 ], [ %13, %7 ]
  %exitcond = icmp ne i64 %6, %1
  br i1 %exitcond, label %7, label %14

7:                                                ; preds = %4
  %8 = getelementptr inbounds i16, ptr %0, i64 %6
  %9 = load i16, ptr %8, align 2
  %10 = or i16 %5, %9
  %11 = tail call zeroext i16 @toASCIILower(i16 noundef zeroext %9)
  %12 = getelementptr inbounds i16, ptr %2, i64 %6
  store i16 %11, ptr %12, align 2
  %13 = add i64 %6, 1
  br label %4, !llvm.loop !10

14:                                               ; preds = %4
  %.lcssa = phi i16 [ %5, %4 ]
  %.not = icmp ult i16 %.lcssa, 128
  %. = select i1 %.not, i64 1, i64 0
  ret i64 %.
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(none) uwtable
define internal zeroext i16 @toASCIILower(i16 noundef zeroext %0) #6 {
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
attributes #5 = { nofree noinline norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
