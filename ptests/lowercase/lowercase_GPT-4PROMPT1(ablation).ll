; ModuleID = 'lowercase_unoptimized.ll'
source_filename = "lowercase.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@0 = internal global [16 x i16] [i16 72, i16 69, i16 76, i16 76, i16 79, i16 32, i16 87, i16 79, i16 82, i16 76, i16 68, i16 33, i16 72, i16 69, i16 76, i16 76], align 16
@1 = private unnamed_addr constant [29 x i8] c"iterations (%ld characters)\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  br label %3

3:                                                ; preds = %5, %2
  %.0 = phi i64 [ 0, %2 ], [ %6, %5 ]
  %4 = icmp ult i64 %.0, 32
  br i1 %4, label %5, label %7

5:                                                ; preds = %3
  call void @2(i64 noundef %.0)
  %6 = add i64 %.0, 1
  br label %3, !llvm.loop !6

7:                                                ; preds = %3
  ret i32 0
}

; Function Attrs: noinline nounwind uwtable
define internal void @2(i64 noundef %0) #0 {
  %2 = add i64 %0, 15
  %3 = and i64 %2, -16
  %4 = shl i64 %3, 1
  %5 = call ptr @malloc(i64 noundef %4) #5
  br label %6

6:                                                ; preds = %8, %1
  %.0 = phi i64 [ 0, %1 ], [ %10, %8 ]
  %7 = icmp ult i64 %.0, %3
  br i1 %7, label %8, label %11

8:                                                ; preds = %6
  %9 = getelementptr inbounds i16, ptr %5, i64 %.0
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 2 dereferenceable(32) %9, ptr noundef nonnull align 16 dereferenceable(32) @0, i64 32, i1 false)
  %10 = add i64 %.0, 16
  br label %6, !llvm.loop !8

11:                                               ; preds = %6
  %12 = call ptr @malloc(i64 noundef %4) #5
  %13 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @1, i64 noundef %0, i64 noundef %0) #6
  call void @llvm.memset.p0.i64(ptr align 2 %12, i8 0, i64 %4, i1 false)
  br label %14

14:                                               ; preds = %16, %11
  %.1 = phi i64 [ 0, %11 ], [ %18, %16 ]
  %15 = icmp ult i64 %.1, 10000000
  br i1 %15, label %16, label %19

16:                                               ; preds = %14
  %17 = call i64 @3(ptr noundef %5, i64 noundef %0, ptr noundef %12)
  %18 = add i64 %.1, 1
  br label %14, !llvm.loop !9

19:                                               ; preds = %14
  ret void
}

; Function Attrs: allocsize(0)
declare ptr @malloc(i64 noundef) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: noinline nounwind uwtable
define internal i64 @3(ptr noalias noundef %0, i64 noundef %1, ptr noalias noundef %2) #0 {
  br label %4

4:                                                ; preds = %6, %3
  %.02 = phi i16 [ 0, %3 ], [ %11, %6 ]
  %.01 = phi i64 [ 0, %3 ], [ %12, %6 ]
  %5 = icmp ult i64 %.01, %1
  br i1 %5, label %6, label %13

6:                                                ; preds = %4
  %7 = getelementptr inbounds i16, ptr %0, i64 %.01
  %8 = load i16, ptr %7, align 2
  %9 = call zeroext i16 @4(i16 noundef zeroext %8)
  %10 = getelementptr inbounds i16, ptr %2, i64 %.01
  store i16 %9, ptr %10, align 2
  %11 = or i16 %8, %.02
  %12 = add i64 %.01, 1
  br label %4, !llvm.loop !10

13:                                               ; preds = %4
  %.not = icmp ult i16 %.02, 128
  br i1 %.not, label %14, label %15

14:                                               ; preds = %13
  br label %16

15:                                               ; preds = %13
  br label %16

16:                                               ; preds = %15, %14
  %.0 = phi i64 [ 0, %15 ], [ 1, %14 ]
  ret i64 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal zeroext i16 @4(i16 noundef zeroext %0) #0 {
  %2 = icmp ugt i16 %0, 64
  br i1 %2, label %3, label %6

3:                                                ; preds = %1
  %4 = icmp ult i16 %0, 91
  %5 = select i1 %4, i16 32, i16 0
  br label %6

6:                                                ; preds = %3, %1
  %7 = phi i16 [ 0, %1 ], [ %5, %3 ]
  %8 = or i16 %7, %0
  ret i16 %8
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #5 = { nounwind allocsize(0) }
attributes #6 = { nounwind }

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
